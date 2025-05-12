import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/Application/Hotel&Place_Bloc/hotel_place_bloc.dart';
import 'package:travelapp/Application/HotelBloc/hotel_bloc.dart';
import 'package:travelapp/Core/Hotelsname.dart';
import 'package:travelapp/Domain/DB/Infrastructure/FirestoreMethod.dart';
import 'package:travelapp/Domain/UnsplashSearch/unsplash_search/unsplash_search.dart';
import 'package:travelapp/Functions/savehotelsdata.dart';
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
  static bool _isLoaded = false; // static - only once for this screen

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (!_isLoaded) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<HotelBloc>().add(const HotelEvent.hotelDetailsGet1());
        context.read<Hotel1Bloc>().add(const Hotel1Event.hotel1DetailsGet());
        context
            .read<HotelPlaceBloc>()
            .add(const HotelPlaceEvent.hotelDetailsGet());
      });
      _isLoaded = true;
    }
    log('message');
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
                print('list =========== ${state.hotelModelList1}');
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
                              //--------------------------------------- here ------------------------------------------------------
                              SizedBox(
                                  height: size.height / 20,
                                  width: size.width / 1.5,
                                  child: saveiconwidget(data: data)),
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
                          List<String> location = hotelsname3.map((place) {
                            List<String> parts = place.split(', ');
                            return parts.length > 1 ? parts[1] : place;
                          }).toList();
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
  
class saveiconwidget extends StatelessWidget {
  saveiconwidget({super.key, required this.data});
  final UnsplashSearch data;
   ValueNotifier<List<String>> saves = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
   
    WidgetsBinding.instance.addPostFrameCallback((_) async {
       saves = (await fetchSavedHotels(currentuserdata.value.uid!)) as ValueNotifier<List<String>>;
    });
     
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
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: SizedBox(
                  height: 30,
                  child: Text(
                      data.description ?? 'Currently name are unavailable')),
              trailing: IconButton(
                  onPressed: () async {
                    //add & remove data in firebase
                    print(data.id);
                    if (!saves.value.contains(data.id.toString())) {
                      saves.value.add(data.id.toString());
                      saves.notifyListeners();
                      FirestoreMethods().hotelsaved(
                          hotelId: "${data.id}-09${currentuserdata.value.uid}",
                          name: khotelname[khotelname.length % 10],
                          decription:
                              data.description ?? "curremtly unavailable",
                          rating: data.likes!,
                          imageurl: data.urls!.regular!,
                          subimageurl: [],
                          price: "${data.likes!}0",
                          reviewno: '23',
                          username: currentuserdata.value.username,
                          userid: currentuserdata.value.uid!,
                          userimageurl: currentuserdata.value.photoUrl);
                    } else {
                      saves.value.remove(data.id.toString());
                      saves.notifyListeners();

                      await FirestoreMethods().deleteHotelSaved(
                          hotelId: "${data.id}-09${currentuserdata.value.uid}");
                    }
                  },
                  icon: Icon(
                    saves.value.contains(data.id.toString()) ? ksaved : ksave,
                    color: kDominantcolor,
                  )));
        });
  }
}
