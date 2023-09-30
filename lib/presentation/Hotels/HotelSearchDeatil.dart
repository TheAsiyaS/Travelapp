import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/Application/HotelBloc/hotel_bloc.dart';
import 'package:travelapp/Core/Hotelsname.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/Appbar.dart';
import 'package:travelapp/widgets/ElevatedbuttonWidget.dart';
import 'package:travelapp/widgets/HotelDetailWidget.dart';
import 'package:travelapp/widgets/OnlyImageBox.dart';

class HotelSearchDetailed extends StatelessWidget {
  const HotelSearchDetailed({super.key, required this.querry});
  final String querry;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotelBloc>(context)
          .add(HotelEvent.hotelDetailsGet2(querry2: querry));
    });

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height / 7),
          child: SimpleAppbar(
            size: size,
            id: 'HotelSearchBar',
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          h10,
          const Text(
            'Prominant Hotels',
            style: textstyle,
          ),
          h10,
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Filter ',
                style: subtextstyle,
              ),
              Icon(
                kDown,
                color: kgrey,
              )
            ],
          ),
          SizedBox(
              height: size.height / 1.5,
              width: size.width,
              child: BlocBuilder<HotelBloc, HotelState>(
                builder: (context, state) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        final data = state.hotelModelList2[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HotelDetailedWidget(
                                    url: '',
                                    title: 'title',
                                    subtitle: 'subtitle',
                                    price: 'price',
                                    rating: 'rating',
                                    about: 'about')));
                          },
                          child: Container(
                            height: size.height / 4,
                            width: size.width / 1.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: OnlyimageBoxWidget(
                                        height: size.height / 5.5,
                                        width: size.width / 2.4,
                                        boxdecoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                data.urls!.regular!),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        childwidget: h10,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            touristPlaces[
                                                index % touristPlaces.length],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 50,
                                            width: size.width,
                                            child: const Text(
                                              'Water is an inorganic compound with the chemical formula H₂O. It is a transparent, tasteless, odorless, and nearly colorless chemical substance, and it is the main constitue',
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: kdominatgrey),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: size.width / 5, top: 5),
                                            child: SizedBox(
                                              width: size.width / 3,
                                              height: size.height / 20,
                                              child: ElevatedButtonWidget(
                                                  onPress: () {},
                                                  buttonwidget: Text(
                                                    'Book Now',
                                                    style: GoogleFonts
                                                        .dancingScript(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 25,
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                190,
                                                                225,
                                                                254)),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        kbottomSubDominant,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      side: const BorderSide(
                                                          color: kDominantcolor,
                                                          width:
                                                              2.0), // Border properties
                                                    ),
                                                  )),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return h10;
                      },
                      itemCount: state.hotelModelList2.length);
                },
              ))
        ],
      ),
    );
  }
}
