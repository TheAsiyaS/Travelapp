import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/Application/Hotel&Place_Bloc/hotel_place_bloc.dart';
import 'package:travelapp/Application/HotelBloc/hotel_bloc.dart';
import 'package:travelapp/Domain/DB/Infrastructure/FirestoreMethod.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/main.dart';
import 'package:travelapp/widgets/CircularProgressIndicator.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';
import 'package:travelapp/widgets/IconButton.dart';
import 'package:travelapp/widgets/RatingBar.dart';
import 'package:travelapp/widgets/SearchItemDetailed.dart';
import 'package:travelapp/widgets/TextButton.dart';

class Cheep extends StatelessWidget {
  const Cheep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotelPlaceBloc>(context)
          .add(const HotelPlaceEvent.cheep());
      BlocProvider.of<HotelBloc>(context).add(const HotelEvent.cheap());
    });
    final places = [
      'Lombok',
      'Bali',
      'Nusa Penida',
      'Nusa Lembongan',
      'Komodo Island',
      'Flores',
      'Sumbawa',
      'Java',
      'Sulawesi',
      'Borneo (Kalimantan)',
    ];
    final ValueNotifier<List<String>> likes = ValueNotifier([]);

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BlocBuilder<HotelPlaceBloc, HotelPlaceState>(builder: (context, state) {
          if (state.isLoading == true) {
            return const WidgetCircularProgressIndicator(
                indicatorColor: kdominatgrey);
          } else if (state.iserror == true) {
            return const Text('Some error occured');
          } else if (state.cheap.isEmpty) {
            return const Center(child: Text('No Data found'));
          } else {
            return SizedBox(
              height: size.height / 3,
              width: size.width,
              child: GridView.count(
                crossAxisCount: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 4,
                scrollDirection: Axis.horizontal,
                children: List.generate(state.cheap.length, (index) {
                  final data = state.cheap[index];
                  final List<String> imagesUrl = [
                    state.cheap[0].largeImageUrl!,
                    state.cheap[1].largeImageUrl!,
                    state.cheap[2].largeImageUrl!,
                    state.cheap[3].largeImageUrl!,
                    state.cheap[4].largeImageUrl!,
                    state.cheap[5].largeImageUrl!,
                  ];

                  imagesUrl.shuffle();
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SearchItemDetailed(
                              imageurl: data.largeImageUrl!,
                              suburls: imagesUrl,
                              price: '${data.imageHeight! / 5}',
                              title: places[index % places.length],
                              subtitle: '',
                              rating: data.comments!,
                              reviewNo: '${data.comments!}',
                              obj: '')));
                    },
                    child: Container(
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
                                                snapshot.data!.docs.map((doc) {
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
                                            likes.value = List.from(likes.value)
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
                                                  childwidget: IconButtonWidget(
                                                    onPressFunc: () async {
                                                      print('id : ${data.id}');
                                                      if (!likes.value.contains(
                                                          data.id.toString())) {
                                                        likes.value = List.from(
                                                            likes.value)
                                                          ..add(data.id
                                                              .toString());

                                                        await FirestoreMethods().placesaved(
                                                            placeId:
                                                                "${data.id}-${currentuserdata.uid}",
                                                            name: places[index %
                                                                places.length],
                                                            decription:
                                                                'Popular tourists place in the world . ${places[index]}\'s top place . good air condition & safe also.',
                                                            rating:
                                                                data.comments!,
                                                            imageurl: data
                                                                .largeImageUrl!,
                                                            subimageurl:
                                                                imagesUrl,
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
                                                        likes.value = List.from(
                                                            likes.value)
                                                          ..remove(data.id
                                                              .toString());

                                                        await FirestoreMethods()
                                                            .deletePlaceSaved(
                                                                placedId:
                                                                    "${data.id}-${currentuserdata.uid}");
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
                                      })),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('asset/logo.png'),
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
                                    RatingBar(
                                        intialvalue: data.comments!,
                                        height: size.height / 15,
                                        width: size.width / 1.5,
                                        scrolldirection: Axis.horizontal),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            );
          }
        }),
        Row(
          children: [
            const Text(
              'Some Cheapest',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Spacer(),
            TextbuttonWidget(
                onPressFunc: () {},
                childwidget: const Text(
                  'See all',
                  style: TextStyle(color: kDominanttextcolor),
                ))
          ],
        ),
        BlocBuilder<HotelBloc, HotelState>(
          builder: (context, state) {
            if (state.isLoading == true) {
              return const WidgetCircularProgressIndicator(
                  indicatorColor: kdominatgrey);
            } else if (state.iserror == true) {
              return const Text('Some error occured');
            } else if (state.cheep.isEmpty) {
              return const Center(child: Text('No Data found'));
            } else {
              return SizedBox(
                height: size.height / 5,
                width: size.width,
                child: GridView.count(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 4,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(state.cheep.length, (index) {
                    final data = state.cheep[index];
                    final List<String> imagesUrl = [
                      state.cheep[0].largeImageUrl!,
                      state.cheep[1].largeImageUrl!,
                      state.cheep[2].largeImageUrl!,
                      state.cheep[3].largeImageUrl!,
                      state.cheep[4].largeImageUrl!,
                      state.cheep[5].largeImageUrl!,
                    ];
                    imagesUrl.shuffle();
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SearchItemDetailed(
                                imageurl: data.largeImageUrl!,
                                suburls: imagesUrl,
                                price: '${data.imageHeight! / 5}',
                                title: places[index % places.length],
                                subtitle: '',
                                rating: data.comments!,
                                reviewNo: '${data.comments!}',
                                obj: '')));
                      },
                      child: Container(
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
                        ),
                      ),
                    );
                  }),
                ),
              );
            }
          },
        )
      ],
    ));
  }
}
