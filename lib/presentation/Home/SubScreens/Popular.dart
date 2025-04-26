import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/Application/Hotel&Place_Bloc/hotel_place_bloc.dart';
import 'package:travelapp/Domain/DB/Infrastructure/FirestoreMethod.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/main.dart';
import 'package:travelapp/widgets/CircularProgressIndicator.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';
import 'package:travelapp/widgets/OnlyImageBox.dart';
import 'package:travelapp/widgets/RatingBar.dart';
import 'package:travelapp/widgets/SearchItemDetailed.dart';

class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotelPlaceBloc>(context)
          .add(const HotelPlaceEvent.popular());
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
    ValueNotifier<bool> islike = ValueNotifier(false);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height / 1.5,
            child: BlocBuilder<HotelPlaceBloc, HotelPlaceState>(
                builder: (context, state) {
              if (state.isLoading == true) {
                return const WidgetCircularProgressIndicator(
                    indicatorColor: kdominatgrey);
              } else if (state.iserror == true) {
                return Center(child: const Text('Some error occured'));
              } else if (state.popular.isEmpty) {
                return Center(child: const Text('No Data found'));
              } else {
                return ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final data = state.popular[index];
                      final List<String> subimagesUrl = [
                        state.popular[0].largeImageUrl!,
                        state.popular[1].largeImageUrl!,
                        state.popular[2].largeImageUrl!,
                        state.popular[3].largeImageUrl!,
                        state.popular[4].largeImageUrl!,
                        state.popular[5].largeImageUrl!,
                      ];
                      subimagesUrl.shuffle();
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SearchItemDetailed(
                                  imageurl: data.largeImageUrl!,
                                  suburls: subimagesUrl,
                                  price: '${data.imageHeight! / 5}',
                                  title: places[index % places.length],
                                  subtitle: 'paris',
                                  rating: data.comments!,
                                  reviewNo: '${data.comments}',
                                  obj: 'obj')));
                        },
                        child: Container(
                          height: size.height / 2.5,
                          width: size.width / 1.7,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(data.largeImageUrl!),
                                fit: BoxFit.cover,
                                opacity: 70,
                              )),
                          child: Container(
                            height: size.height / 2.5,
                            width: size.width / 1.7,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                               // ktransparent,
                                 ktransparent,
                              const Color.fromARGB(255, 0, 0, 0),
                              ],
                            )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      places[index % places.length],
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: kwhite),
                                    ),
                                      const Row(
                                      children: [
                                        Icon(kLocation,color: Color.fromARGB(154, 255, 255, 255)),
                                        Text(
                                          'Paris',
                                          style: TextStyle(color: kwhite),
                                        ),
                                      ],
                                    ),
                                    RatingBar(
                                        intialvalue: data.comments!,
                                        height: size.height / 15,
                                        width: size.width / 1.5,
                                        scrolldirection: Axis.horizontal),
                                    h20,
                                  ],
                                ),
                                FutureBuilder(
                                    future: FirebaseFirestore.instance
                                        .collection("SavedPlaces")
                                        .where('userid',
                                            isEqualTo:
                                                currentuserdata.value.uid)
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
                                          List<String> likedPostNumericIds =
                                              snapshot.data!.docs.map((doc) {
                                            if (doc
                                                .data()
                                                .containsKey('placeId')) {
                                              String fullId =
                                                  doc.get('placeId').toString();
                                              var parts = fullId.split('-');
                                              return parts.first;
                                            } else {
                                              return '102840';
                                            }
                                          }).toList();

                                          likes.value.clear();
                                          likes.value
                                              .addAll(likedPostNumericIds);
                                        }

                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            ValueListenableBuilder(
                                                valueListenable: islike,
                                                builder: (context, value, _) {
                                                  print(
                                                      "like data :${likes.value}");
                                                  return GestureDetector(
                                                    onTap: () async {
                                                      islike.value =
                                                          !islike.value;
                                                      if (!likes.value.contains(
                                                          data.id.toString())) {
                                                        likes.value
                                                            .add("${data.id}");
                                                        await FirestoreMethods().placesaved(
                                                            placeId:
                                                                "${data.id}-${currentuserdata.value.uid}",
                                                            name: places[index %
                                                                places.length],
                                                            decription:
                                                                'Popular tourists place in the world . ${places[index]}\'s top place . good air condition & safe also.',
                                                            rating:
                                                                data.comments!,
                                                            imageurl: data
                                                                .largeImageUrl!,
                                                            subimageurl:
                                                                subimagesUrl,
                                                            price:
                                                                '${data.imageHeight! / 5}',
                                                            reviewno:
                                                                '${data.comments}',
                                                            username:
                                                                currentuserdata
                                                                    .value
                                                                    .username,
                                                            userid:
                                                                currentuserdata
                                                                    .value.uid!,
                                                            userimageurl:
                                                                currentuserdata 
                                                                    .value
                                                                    .photoUrl);
                                                      } else {
                                                        likes.value.remove(
                                                            "${data.id}");

                                                        await FirestoreMethods()
                                                            .deletePlaceSaved(
                                                                placedId:
                                                                    "${data.id}-${currentuserdata.value.uid}");
                                                      }
                                                    },
                                                    child: ConatinerwithWidget(
                                                        containerdecoration:
                                                            BoxDecoration(
                                                                color:
                                                                    klightwhite,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50)),
                                                        childwidget: likes.value
                                                                .contains(data
                                                                    .id
                                                                    .toString())
                                                            ? const Icon( // curry-yum annu kodukkunadh , edhalam apol dhehikum
                                                                kfavorite,
                                                                color:
                                                                    kDominantcolor,
                                                              )
                                                            : const Icon(
                                                                kfavoriteOutline,
                                                                color:
                                                                    kDominantcolor,
                                                              ),
                                                        height: 50,
                                                        width: 50),
                                                  );
                                                }),
                                            Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: SizedBox(
                                                height: size.height / 4,
                                                width: 50,
                                                child: ListView.separated(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return OnlyimageBoxWidget(
                                                          height: 50,
                                                          width: 50,
                                                          boxdecoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              image: DecorationImage(
                                                                  image: NetworkImage(
                                                                      subimagesUrl[
                                                                          index]),
                                                                  fit: BoxFit
                                                                      .fill)),
                                                          childwidget:
                                                              const Column(
                                                            children: [],
                                                          ));
                                                    },
                                                    separatorBuilder:
                                                        (context, index) {
                                                      return h20;
                                                    },
                                                    itemCount: 3),
                                              ),
                                            ),
                                          ],
                                        );
                                      }
                                    })
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return h10;
                    },
                    itemCount: 10);
              }
            }),
          ),
        ],
      ),
    );
  }
}
