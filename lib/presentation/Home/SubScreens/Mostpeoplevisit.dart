import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/Application/Hotel&Place_Bloc/hotel_place_bloc.dart';
import 'package:travelapp/Application/HotelBloc/hotel_bloc.dart';
import 'package:travelapp/Domain/DB/Infrastructure/FirestoreMethod.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/main.dart';
import 'package:travelapp/widgets/CircularProgressIndicator.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';
import 'package:travelapp/widgets/IconButton.dart';

class Mostpeoplevisit extends StatelessWidget {
  const Mostpeoplevisit({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotelPlaceBloc>(context)
          .add(const HotelPlaceEvent.mostpeoplevisit());
      BlocProvider.of<HotelBloc>(context)
          .add(const HotelEvent.mostPeopleVisit());
    });
    final size = MediaQuery.of(context).size;
    final places = [
      'Versailles',
      'Giverny',
      'Fontainebleau',
      'Vaux-le-Vicomte',
      'Disneyland',
      'Mont Saint-Michel',
      'Malmaison',
      'Auvers-sur-Oise',
      'Compiègne',
      'Chantilly',
    ];
    final ValueNotifier<List<String>> likes = ValueNotifier([]);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height / 2.5,
            width: size.width,
            child: BlocBuilder<HotelPlaceBloc, HotelPlaceState>(
              builder: (context, state) {
                return GridView.count(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 2.5,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(state.mostpeoplevist.length, (index) {
                    if (state.isLoading == true) {
                      return const WidgetCircularProgressIndicator(
                          indicatorColor: kdominatgrey);
                    } else if (state.iserror == true) {
                      return const Text('Some error occured');
                    } else if (state.mostpeoplevist.isEmpty) {
                      return const Center(child: Text('No Data found'));
                    } else {
                      final data = state.mostpeoplevist[index];
                      return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(data.largeImageUrl!),
                                  fit: BoxFit.cover)),
                          child: Container(
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [ktransparent, kblackdarktrans])),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: FutureBuilder(
                                        future: FirebaseFirestore.instance
                                            .collection("SavedPlaces")
                                            .where('userid',
                                                isEqualTo: currentuserdata.value.uid)
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
                                            if (currentuserdata.value.uid != null) {
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
                                                            color: klightwhite,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                    childwidget:
                                                        IconButtonWidget(
                                                      onPressFunc: () async {
                                                        print(
                                                            'id : ${data.id}');
                                                        if (!likes.value
                                                            .contains(data.id
                                                                .toString())) {
                                                          likes.value = List
                                                              .from(likes.value)
                                                            ..add(data.id
                                                                .toString());

                                                          await FirestoreMethods().placesaved(
                                                              placeId:
                                                                  "${data.id}-${currentuserdata.value.uid}",
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
                                                                  currentuserdata.value
                                                                      .username,
                                                              userid:
                                                                  currentuserdata.value
                                                                      .uid!,
                                                              userimageurl:
                                                                  currentuserdata.value
                                                                      .photoUrl);
                                                        } else {
                                                          print("delete");
                                                          likes.value = List
                                                              .from(likes.value)
                                                            ..remove(data.id
                                                                .toString());

                                                          await FirestoreMethods()
                                                              .deletePlaceSaved(
                                                                  placedId:
                                                                      "${data.id}-${currentuserdata.value.uid}");
                                                        }
                                                      },
                                                      iconwidget: likes.value
                                                              .contains(data.id
                                                                  .toString())
                                                          ? const Icon(
                                                              kfavorite,
                                                              color:
                                                                  kDominantcolor,
                                                            )
                                                          : const Icon(
                                                              kfavoriteOutline,
                                                              color:
                                                                  kDominantcolor,
                                                            ),
                                                    ),
                                                  );
                                                });
                                          }
                                        }),
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 70,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                                  AssetImage('asset/logo.png'),
                                              fit: BoxFit.cover)),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          places[index % places.length],
                                          style: const TextStyle(
                                              color: kwhite,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ));
                    }
                  }),
                );
              },
            ),
          ),
          h20,
          const Text(
            'Top 10 places',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          h20,
          SizedBox(
            height: size.height / 7,
            width: size.width,
            child: BlocBuilder<HotelBloc, HotelState>(
              builder: (context, state) {
                return GridView.count(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 3,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(10, (index) {
                    if (state.isLoading == true) {
                      return const WidgetCircularProgressIndicator(
                          indicatorColor: kdominatgrey);
                    } else if (state.iserror == true) {
                      return const Text('Some error occured');
                    } else if (state.mostPeopleVisit.isEmpty) {
                      return const Text('No Data found');
                    } else {
                      final data = state.mostPeopleVisit[index];
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(data.largeImageUrl!),
                                fit: BoxFit.cover)),
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [ktransparent, kblackdarktrans])),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: size.width / 5),
                                child: IconButtonWidget(
                                    onPressFunc: () {},
                                    iconwidget: const Icon(
                                      kfavoriteOutline,
                                      color: kwhite,
                                      size: 20,
                                    )),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('asset/logo.png'),
                                        fit: BoxFit.cover)),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
