import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:travelapp/Application/Hotel&Place_Bloc/hotel_place_bloc.dart';
import 'package:travelapp/Domain/DB/Infrastructure/FirestoreMethod.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/main.dart';
import 'package:travelapp/widgets/CircularProgressIndicator.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';
import 'package:travelapp/widgets/SearchItemDetailed.dart';

class Adavanture extends StatelessWidget {
  const Adavanture({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotelPlaceBloc>(context)
          .add(const HotelPlaceEvent.advanture());
    });
    final places = [
      'Machu Picchu, Peru',
      'Patagonia, Chile and Argentina',
      'New Zealand',
      'Costa Rica',
      'Santorini, Greece',
      'Bora Bora, French Polynesia',
      'Banff National Park, Canada',
      'Nepal',
      'Iceland',
      'Galápagos Islands, Ecuador',
      'Aoraki/Mount Cook National Park, New Zealand',
      'Alaska, USA',
      'The Swiss Alps, Switzerland',
      'Victoria Falls, Zambia/Zimbabwe',
      'Amazon Rainforest, Brazil/Peru',
    ];
    final ValueNotifier<List<String>> likes = ValueNotifier([]);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: BlocBuilder<HotelPlaceBloc, HotelPlaceState>(
                  builder: (context, state) {
                if (state.isLoading == true) {
                  return const WidgetCircularProgressIndicator(
                      indicatorColor: kdominatgrey);
                } else if (state.iserror == true) {
                  return const Text('Some error occured');
                } else if (state.advanture.isEmpty) {
                  return const Center(child: Text('No Data found'));
                } else {
                  return GridView.custom(
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 2,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 20,
                      repeatPattern: QuiltedGridRepeatPattern.inverted,
                      pattern: [
                        const QuiltedGridTile(2, 1),
                        const QuiltedGridTile(1, 1),
                        const QuiltedGridTile(1, 1),
                        const QuiltedGridTile(1, 1),
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                        childCount: state.advanture.length, (context, index) {
                      final data = state.advanture[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SearchItemDetailed(
                                  imageurl: data.largeImageUrl!,
                                  suburls: const [],
                                  price: "${data.comments}0",
                                  title: places[index % places.length],
                                  subtitle:
                                      ' rope climbing exercises, obstacle courses, bouldering, rock climbing, target oriented activities, and zip-lines. They are usually intended for recreation.',
                                  rating: data.comments!,
                                  reviewNo: data.comments!.toString(),
                                  obj: 'obj')));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(data.largeImageUrl!),
                                  fit: BoxFit.cover)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: 90,
                                      child: Text(
                                        places[index % places.length],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const Spacer(),
                                    FutureBuilder(
                                        future: FirebaseFirestore.instance
                                            .collection("SavedPlaces")
                                            .where('userid',
                                                isEqualTo: currentuserdata.uid)
                                            .get(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: kwhite,
                                            );
                                          } else if (snapshot.hasError) {
                                            return const CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: kRed,
                                            );
                                          } else {
                                            if (currentuserdata.uid != null) {
                                              // Extract only the numeric part of the PlaceId if it exists
                                              List<String> likedPostNumericIds =
                                                  snapshot.data!.docs
                                                      .map((doc) {
                                                // Check if the 'PlaceId' field exists in the document
                                                if (doc
                                                    .data()
                                                    .containsKey('placeId')) {
                                                  String fullId = doc
                                                      .get('placeId')
                                                      .toString();
                                                  var parts = fullId.split('-');
                                                  return parts.first;
                                                } else {
                                                  return '102840';
                                                }
                                              }).toList();

                                              likes.value.clear();
                                              likes.value = List.from(
                                                  likes.value)
                                                ..addAll(likedPostNumericIds);
                                            }
                                            print('likes : ${likes.value}');
                                            return ValueListenableBuilder(
                                                valueListenable: likes,
                                                builder: (context, value, _) {
                                                  return ConatinerwithWidget(
                                                      height: 50,
                                                      width: 50,
                                                      containerdecoration:
                                                          BoxDecoration(
                                                              color:
                                                                  klightwhite,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      childwidget: IconButton(
                                                        onPressed: () async {
                                                          print(
                                                              'id : ${data.id}');
                                                          if (!likes.value
                                                              .contains(data.id
                                                                  .toString())) {
                                                            likes.value = List
                                                                .from(
                                                                    likes.value)
                                                              ..add(data.id
                                                                  .toString());

                                                            await FirestoreMethods().placesaved(
                                                                placeId:
                                                                    "${data.id}-${currentuserdata.uid}",
                                                                name: places[index %
                                                                    places
                                                                        .length],
                                                                decription:
                                                                    'Popular tourists place in the world . ${places[index]}\'s top place . good air condition & safe also.',
                                                                rating: data
                                                                    .comments!,
                                                                imageurl: data
                                                                    .largeImageUrl!,
                                                                subimageurl: [],
                                                                price:
                                                                    '${data.imageHeight! / 5}',
                                                                reviewno:
                                                                    '${data.comments}',
                                                                username:
                                                                    currentuserdata
                                                                        .username,
                                                                userid:
                                                                    currentuserdata
                                                                        .uid!,
                                                                userimageurl:
                                                                    currentuserdata
                                                                        .photoUrl);
                                                          } else {
                                                            print("delete");
                                                            likes.value = List
                                                                .from(
                                                                    likes.value)
                                                              ..remove(data.id
                                                                  .toString());

                                                            await FirestoreMethods()
                                                                .deletePlaceSaved(
                                                                    placedId:
                                                                        "${data.id}-${currentuserdata.uid}");
                                                          }
                                                        },
                                                        icon: likes.value
                                                                .contains(data
                                                                    .id
                                                                    .toString())
                                                            ? const Icon(
                                                                kfavorite,
                                                              )
                                                            : const Icon(
                                                                kfavoriteOutline,
                                                                color:
                                                                    kDominantcolor,
                                                              ),
                                                      ));
                                                });
                                          }
                                        })
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                }
              }),
            ),
          )
        ],
      ),
    );
  }
}
