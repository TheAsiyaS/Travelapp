import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/Application/Hotel&Place_Bloc/hotel_place_bloc.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/CircularProgressIndicator.dart';
import 'package:travelapp/widgets/IconButton.dart';
import 'package:travelapp/widgets/OnlyImageBox.dart';
import 'package:travelapp/widgets/SearchItemDetailed.dart';

class Historical extends StatelessWidget {
  const Historical({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotelPlaceBloc>(context)
          .add(const HotelPlaceEvent.historical());
    });
    final size = MediaQuery.of(context).size;
    final places = [
      'The Great Wall of China, China',
      'The Pyramids of Giza, Egypt',
      'The Colosseum, Rome, Italy',
      'Machu Picchu, Peru',
      'Angkor Wat, Cambodia',
      'Petra, Jordan',
      'The Acropolis, Athens, Greece',
      'The Taj Mahal, India',
      'The Palace of Versailles, France',
      'Ephesus, Turkey',
    ];
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            height: size.height / 1.5,
            width: size.width,
            child: BlocBuilder<HotelPlaceBloc, HotelPlaceState>(
                builder: (context, state) {
              if (state.isLoading == true) {
                return const WidgetCircularProgressIndicator(
                    indicatorColor: kdominatgrey);
              } else if (state.iserror == true) {
                return const Text('Some error occured');
              } else if (state.historical.isEmpty) {
                return const Center(child: Text('No Data found'));
              } else {
                List<String> countryNames = places.map((place) {
                  List<String> parts = place.split(', ');
                  return parts.length > 1
                      ? parts[1]
                      : place; // Get the last part as the country name
                }).toList();

                // Print the extracted country names
                for (var country in countryNames) {}

                return ListView.separated(
                  itemBuilder: (context, index) {
                    final data = state.historical[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SearchItemDetailed(
                                imageurl: data.largeImageUrl!,
                                suburls: const [],
                                price: "${data.imageHeight}.9",
                                title: countryNames[index % places.length],
                                subtitle: 'subtitle',
                                rating: 3,
                                reviewNo: 'reviewNo',
                                obj: 'obj')));
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
                                    height: size.height / 4.5,
                                    width: size.width / 2.5,
                                    boxdecoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        bottomLeft: Radius.circular(20.0),
                                      ),
                                      image: DecorationImage(
                                        image:
                                            NetworkImage(data.largeImageUrl!),
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
                                      SizedBox(
                                        height: 30,
                                        child: Text(
                                          places[index % places.length],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 100,
                                        width: size.width,
                                        child: const Text(
                                          'Spanning thousands of miles, this ancient fortification is a testament to China\'s rich history, offering visitors a chance to walk in the footsteps of emperors and warriors.',
                                          maxLines: 5,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: kdominatgrey),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          IconButtonWidget(
                                              onPressFunc: () {},
                                              iconwidget: const Icon(
                                                kLocation,
                                                color: kSubDominantcolor,
                                              )),
                                          Text(
                                              countryNames[
                                                  index % places.length],
                                              style: const TextStyle(
                                                  color: kdominatgrey)),
                                        ],
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
                    return const Divider();
                  },
                  itemCount: state.historical.length,
                );
              }
            }),
          ),
        ),
      ],
    );
  }
}
