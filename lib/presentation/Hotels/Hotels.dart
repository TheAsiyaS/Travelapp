import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/Application/Hotel&Place_Bloc/hotel_place_bloc.dart';
import 'package:travelapp/Application/HotelBloc/hotel_bloc.dart';
import 'package:travelapp/Core/Hotelsname.dart';
import 'package:travelapp/Domain/DB/Infrastructure/FirestoreMethod.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/main.dart';
import 'package:travelapp/widgets/Appbar.dart';
import 'package:travelapp/widgets/CircularProgressIndicator.dart';
import 'package:travelapp/presentation/Hotels/HotelDetailWidget.dart';
import 'package:travelapp/widgets/IconButton.dart';
import 'package:travelapp/widgets/OnlyImageBox.dart';
import 'package:travelapp/widgets/RatingBar.dart';
import 'package:travelapp/widgets/TextButton.dart';

import '../../Application/Hotel1_Bloc/hotel1_bloc.dart';

class Hotels extends StatelessWidget {
  const Hotels({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotelBloc>(context)
          .add(const HotelEvent.hotelDetailsGet1());
      BlocProvider.of<Hotel1Bloc>(context)
          .add(const Hotel1Event.hotel1DetailsGet());
      BlocProvider.of<HotelPlaceBloc>(context)
          .add(const HotelPlaceEvent.hotelDetailsGet());
    });
    final ValueNotifier<List<String>> saves = ValueNotifier([]);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height / 7),
          child: SimpleAppbar(
            size: size,
            id: 'HotelSearchBar',
          )),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<Hotel1Bloc, Hotel1State>(builder: (context, state) {
              if (state.isLoading == true) {
                return const WidgetCircularProgressIndicator(
                    indicatorColor: kdominatgrey);
              } else if (state.iserror == true) {
                return const Text('Some error occured');
              } else if (state.hotelModelList.isEmpty) {
                return const Text('No Data found');
              } else {
                return SizedBox(
                  height: size.height / 6,
                  width: size.width,
                  child: GridView.count(
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1 / 1,
                    scrollDirection: Axis.horizontal,
                    children:
                        List.generate(state.hotelModelList.length, (index) {
                      final data = state.hotelModelList[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HotelDetailedWidget(
                                  hotelid: data.id!,
                                  url: data.urls!.regular!,
                                  title: khotelname[index],
                                  subtitle: 'Londan',
                                  price: '\$${data.likes}0',
                                  rating: data.likes!,
                                  about: data.description ?? '')));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: size.height / 9,
                              width: size.width / 4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(data.urls!.regular!),
                                      fit: BoxFit.cover)),
                            ),
                            Text(kHotelNames2[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ))
                          ],
                        ),
                      );
                    }),
                  ),
                );
              }
            }),
            const Divider(
              color: kSubDominantcolor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Popular Hotels',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                TextbuttonWidget(
                    onPressFunc: () {},
                    childwidget: const Text('See all',
                        style: TextStyle(color: kSubDominantcolor)))
              ],
            ),
            BlocBuilder<HotelBloc, HotelState>(builder: (context, state) {
              if (state.isLoading == true) {
                return const WidgetCircularProgressIndicator(
                    indicatorColor: kdominatgrey);
              } else if (state.iserror == true) {
                return const Text('Some error occured');
              } else if (state.hotelModelList1.isEmpty) {
                return const Text('No Data found');
              } else {
                return SizedBox(
                  height: size.height / 2.8,
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.count(
                      crossAxisCount: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1 / 1,
                      scrollDirection: Axis.horizontal,
                      children:
                          List.generate(state.hotelModelList1.length, (index) {
                        final data = state.hotelModelList1[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HotelDetailedWidget(
                                    hotelid: data.id!,
                                    url: data.urls!.regular!,
                                    title: khotelname[index],
                                    subtitle: 'Londan',
                                    price: '\$${data.likes}0',
                                    rating: 4,
                                    about: data.description ?? '')));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: size.height / 5,
                                width: size.width / 1.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(data.urls!.regular!),
                                        fit: BoxFit.cover)),
                              ),
                              RatingBar(
                                  intialvalue: 3,
                                  height: size.height / 15,
                                  width: size.width / 1.5,
                                  scrolldirection: Axis.horizontal),
                              FutureBuilder(
                                  future: FirebaseFirestore.instance
                                      .collection("SavedHotels")
                                      .where('userid',
                                          isEqualTo: currentuserdata.uid)
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
                                      final String hotelId = data.id.toString();

                                      if (currentuserdata.uid != null) {
                                        List<String> likedPostNumericIds =
                                            snapshot.data!.docs.map((doc) {
                                          if (doc
                                              .data()
                                              .containsKey('hotelId')) {
                                            String fullId =
                                                doc.get('hotelId').toString();
                                            var parts = fullId.split('-09');
                                            return parts.first;
                                          } else {
                                            return '';
                                          }
                                        }).toList();

                                        saves.value = List<String>.from(
                                            likedPostNumericIds);
                                      }

                                      return ValueListenableBuilder(
                                          valueListenable: saves,
                                          builder: (context, value, _) {
                                            print("like data :${saves.value}");
                                            return ListTile(
                                                leading: IconButtonWidget(
                                                    onPressFunc: () {},
                                                    iconwidget: const Icon(
                                                      kLocation,
                                                      color: kSubDominantcolor,
                                                    )),
                                                title: Text(
                                                  '\$${data.likes}0',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                subtitle: SizedBox(
                                                    height: 30,
                                                    child: Text(data
                                                            .description ??
                                                        'Currently name are unavailable')),
                                                trailing: IconButton(
                                                    onPressed: () async {
                                                      //add & remove data in firebase
                                                      print(data.id);
                                                      if (!saves.value.contains(
                                                          data.id.toString())) {
                                                        saves.value
                                                            .add(hotelId);
                                                        saves.notifyListeners();
                                                        FirestoreMethods().hotelsaved(
                                                            hotelId:
                                                                "${data.id}-09${currentuserdata.uid}",
                                                            name: khotelname[
                                                                index],
                                                            decription: data
                                                                    .description ??
                                                                "curremtly unavailable",
                                                            rating: data.likes!,
                                                            imageurl: data
                                                                .urls!.regular!,
                                                            subimageurl: [],
                                                            price:
                                                                "${data.likes!}0",
                                                            reviewno: '23',
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
                                                        saves.value
                                                            .remove(hotelId);
                                                        saves.notifyListeners();

                                                        await FirestoreMethods()
                                                            .deleteHotelSaved(
                                                                hotelId:
                                                                    "${data.id}-09${currentuserdata.uid}");
                                                      }
                                                    },
                                                    icon: Icon(
                                                      saves.value
                                                              .contains(hotelId)
                                                          ? ksaved
                                                          : ksave,
                                                      color: kwhite,
                                                    )));
                                          });
                                    }
                                  }),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                );
              }
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recomanded',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                TextbuttonWidget(
                    onPressFunc: () {},
                    childwidget: const Text('See all',
                        style: TextStyle(color: kSubDominantcolor)))
              ],
            ),
            SizedBox(
              height: size.height / 1.5,
              width: size.width,
              child: BlocBuilder<HotelPlaceBloc, HotelPlaceState>(
                  builder: (context, state) {
                if (state.isLoading == true) {
                  return const WidgetCircularProgressIndicator(
                      indicatorColor: kdominatgrey);
                } else if (state.iserror == true) {
                  return const Text('Some error occured');
                } else if (state.hotel.isEmpty) {
                  return const Text('No Data found');
                } else {
                  kHotelNames2.shuffle();
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      final data = state.hotel;
                      return GestureDetector(
                        onTap: () {
                          final location = hotelsname3[index].split('');
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HotelDetailedWidget(
                                  hotelid: data[index].id!.toString(),
                                  url: data[index].largeImageUrl!,
                                  title: hotelsname3[index],
                                  subtitle: location[index],
                                  price: '\$${data[index].likes}0',
                                  rating: data[index].comments!,
                                  about: hotelsname3[index])));
                        },
                        child: Container(
                          height: size.height / 5,
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
                                      height: size.height / 6,
                                      width: size.width / 2.5,
                                      boxdecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              data[index].largeImageUrl!),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 50,
                                          child: Text(
                                            hotelsname3[index],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40,
                                          width: size.width,
                                          child: const Center(
                                            child: Text(
                                              'Hotel here is more beautiful and safest one . Good neighbourhood ,less pollution, clean water , good view are the remarkable feature of this hotels ',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: kdominatgrey),
                                            ),
                                          ),
                                        ),
                                      
                                        Text(
                                          '\$${data[index].likes}5',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
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
                      return const Divider();
                    },
                    itemCount: state.hotel.length,
                  );
                }
              }),
            ),
          ],
        ),
      )),
    );
  }
}
