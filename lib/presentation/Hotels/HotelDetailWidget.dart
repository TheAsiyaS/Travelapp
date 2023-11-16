import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/Application/HotelBloc/hotel_bloc.dart';
import 'package:travelapp/Domain/DB/Infrastructure/FirestoreMethod.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/main.dart';
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
      required this.about,
      required this.hotelid});
  final String url;
  final String title;
  final String subtitle;
  final String price;
  final int rating;
  final String about;
  final String hotelid;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotelBloc>(context)
          .add(HotelEvent.hotelDetailsGet2(querry2: title));
    });
    final ValueNotifier<List<String>> booked = ValueNotifier([]);

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
                log('data : ${state.hotelModelList.length}\n${state.hotelModelList1.length}');
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
                              Text(subtitle, style: subtextstyle)
                            ],
                          ),
                          Column(
                            children: [
                              IconButtonWidget(
                                  onPressFunc: () {},
                                  iconwidget: const Icon(kpool, color: kwhite)),
                              const Text('Pool', style: subtextstyle)
                            ],
                          ),
                          Column(
                            children: [
                              IconButtonWidget(
                                  onPressFunc: () {},
                                  iconwidget: const Icon(kwifi, color: kwhite)),
                              const Text(
                                'Wifi',
                                style: subtextstyle,
                              )
                            ],
                          ),
                        ],
                      ),
                      FutureBuilder(
                          future: FirebaseFirestore.instance
                              .collection("BookedHotels")
                              .where('userid', isEqualTo: currentuserdata.uid)
                              .get(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator(
                                strokeWidth: 2,
                                color: kdominatgrey,
                              );
                            } else if (snapshot.hasError) {
                              return const CircularProgressIndicator(
                                strokeWidth: 2,
                                color: kRed,
                              );
                            } else {
                              if (currentuserdata.uid != null) {
                                List<String> likedPostNumericIds =
                                    snapshot.data!.docs.map((doc) {
                                  if (doc.data().containsKey('hotelId')) {
                                    String fullId =
                                        doc.get('hotelId').toString();
                                    var parts = fullId.split('-09');
                                    return parts.first;
                                  } else {
                                    return '';
                                  }
                                }).toList();

                                booked.value =
                                    List<String>.from(likedPostNumericIds);
                              }

                              return ValueListenableBuilder(
                                  valueListenable: booked,
                                  builder: (context, value, _) {
                                    print("booked data :${booked.value}");
                                    return SizedBox(
                                      width: size.width / 2,
                                      height: size.height / 15,
                                      child: ElevatedButtonWidget(
                                          onPress: () async {
                                            if (booked.value
                                                .contains(hotelid)) {
                                              booked.value.remove(hotelid);
                                              booked.notifyListeners();

                                              await FirestoreMethods()
                                                  .deleteHotelSaved(
                                                      hotelId:
                                                          "$hotelid-09${currentuserdata.uid}");
                                            } else {
                                              booked.value.add(hotelid);
                                              booked.notifyListeners();
                                              FirestoreMethods().hotelBooked(
                                                  name: title,
                                                  decription:
                                                      "$about The good news is that the hotel standard  is overall excellent, with comfortable and clean rooms well equipped with everything you need. However, hotel prices are comparable to many big European cities, and since space is a valuable commodity , rooms tend to be small. \n29-Jul-2023",
                                                  rating: rating,
                                                  imageurl: url,
                                                  subimageurl: [],
                                                  price: price,
                                                  reviewno: "$rating",
                                                  username:
                                                      currentuserdata.username,
                                                  userid: currentuserdata.uid!,
                                                  userimageurl:
                                                      currentuserdata.photoUrl,
                                                  hotelId:
                                                      "$hotelid-09${currentuserdata.uid}");
                                            }
                                          },
                                          buttonwidget: Text(
                                            booked.value.contains(hotelid)
                                                ? 'Booked'
                                                : 'Book Now',
                                            style: GoogleFonts.dancingScript(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                                color: const Color.fromARGB(
                                                    255, 190, 225, 254)),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: kbottomSubDominant,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              side: const BorderSide(
                                                  color: kDominantcolor,
                                                  width:
                                                      2.0), // Border properties
                                            ),
                                          )),
                                    );
                                  });
                            }
                          })
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
