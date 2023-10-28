import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/Application/HotelBloc/hotel_bloc.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/CircularProgressIndicator.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';
import 'package:travelapp/widgets/ElevatedbuttonWidget.dart';
import 'package:travelapp/widgets/IconButton.dart';
import 'package:travelapp/widgets/RatingBar.dart';

class HotelDetailedWidget extends StatelessWidget {
  const HotelDetailedWidget(
      {super.key,
      required this.url,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.rating,
      required this.about});
  final String url;
  final String title;
  final String subtitle;
  final String price;
  final int rating;
  final String about;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotelBloc>(context)
          .add(HotelEvent.hotelDetailsGet2(querry2: title));
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButtonWidget(
          onPressFunc: () {
            Navigator.of(context).pop();
          },
          iconwidget: const Icon(
            kbackward,
            color: klightwhite,
            size: 35,
          ),
        ),
        backgroundColor: ktransparent,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                ConatinerwithWidget(
                    containerdecoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(url), fit: BoxFit.cover)),
                    childwidget: h10,
                    height: size.height / 2,
                    width: size.width),
                ConatinerwithWidget(
                    containerdecoration: BoxDecoration(
                        color: isDarkMode ? kblack : kwhite,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    childwidget: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: ListTile(
                        title: Text(
                          title,
                          style: textstyle,
                        ),
                        subtitle: Row(
                          children: [
                            const Icon(
                              kLocation,
                              color: kdominatgrey,
                            ),
                            Text('Near $subtitle'),
                          ],
                        ),
                      ),
                    ),
                    height: size.height / 10,
                    width: size.width),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: textstyle,
                      ),
                        RatingBar(
                                      intialvalue: rating,
                                      height: size.height / 15,
                                      width: size.width / 1.5, 
                                      scrolldirection: Axis.horizontal),
                    ],
                  ),
                  const Text(
                    'Starting price',
                    style: subtextstyle,
                  ),
                ],
              ),
            ),
            h10,
            Text(
              '$about The good news is that the hotel standard  is overall excellent, with comfortable and clean rooms well equipped with everything you need. However, hotel prices are comparable to many big European cities, and since space is a valuable commodity , rooms tend to be small. \n29-Jul-2023',
              style: subtextstyle,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
            ),
            h10,
            BlocBuilder<HotelBloc, HotelState>(builder: (context, state) {
              if (state.isLoading == true) {
                return const WidgetCircularProgressIndicator(
                    indicatorColor: kdominatgrey);
              } else if (state.iserror == true) {
                return const Text('Some error occured');
              } else if (state.hotelModelList2.isEmpty) {
                log('list ${state.hotelModelList2.length}');
                return const Text('No Data found');
              } else {
                return SizedBox(
                  height: size.height / 9,
                  width: size.width,
                  child: GridView.count(
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3 / 4,
                    scrollDirection: Axis.horizontal,
                    children:
                        List.generate(state.hotelModelList2.length, (index) {
                      final data = state.hotelModelList2[index];
                      return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(data.urls!.regular!),
                                  fit: BoxFit.cover)),
                          child: h10);
                    }),
                  ),
                );
              }
            }),
            h10,
            Center(
              child: ConatinerwithWidget(
                  containerdecoration: BoxDecoration(
                      color: kDominantcolor,
                      borderRadius: BorderRadius.circular(20)),
                  childwidget: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              IconButtonWidget(
                                  onPressFunc: () {},
                                  iconwidget: const Icon(
                                    kLocation,
                                    color: kwhite,
                                  )),
                              const Text('Location', style: subtextstyle)
                            ],
                          ),
                          Column(
                            children: [
                              IconButtonWidget(
                                  onPressFunc: () {},
                                  iconwidget:
                                      const Icon(kLocation, color: kwhite)),
                              const Text('Location', style: subtextstyle)
                            ],
                          ),
                          Column(
                            children: [
                              IconButtonWidget(
                                  onPressFunc: () {},
                                  iconwidget:
                                      const Icon(kLocation, color: kwhite)),
                              const Text(
                                'Location',
                                style: subtextstyle,
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: size.width / 2,
                        height: size.height / 15,
                        child: ElevatedButtonWidget(
                            onPress: () {},
                            buttonwidget: Text(
                              'Book Now',
                              style: GoogleFonts.dancingScript(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color:
                                      const Color.fromARGB(255, 190, 225, 254)),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kbottomSubDominant,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                    color: kDominantcolor,
                                    width: 2.0), // Border properties
                              ),
                            )),
                      )
                    ],
                  ),
                  height: size.height / 6,
                  width: size.width / 1.5),
            )
          ],
        ),
      ),
    );
  }
}
