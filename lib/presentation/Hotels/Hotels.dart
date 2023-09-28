
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travelapp/Application/HotelBloc/hotel_bloc.dart';
import 'package:travelapp/Core/Hotelsname.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/Appbar.dart';
import 'package:travelapp/widgets/CircularProgressIndicator.dart';

import 'package:travelapp/widgets/HotelDetailWidget.dart';
import 'package:travelapp/widgets/IconButton.dart';
import 'package:travelapp/widgets/OnlyImageBox.dart';
import 'package:travelapp/widgets/TextButton.dart';

class Hotels extends StatelessWidget {
  const Hotels({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((_)  {
      BlocProvider.of<HotelBloc>(context)
          .add(const HotelEvent.hotelDetailsGet1());

      BlocProvider.of<HotelBloc>(context)
          .add(const HotelEvent.hotelDetailsGet());

      // Now both requests have completed
    });

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
                  height: size.height / 6,
                  width: size.width,
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
                                  url: data.urls!.regular!,
                                  title: khotelname[index],
                                  subtitle: 'Londan',
                                  price: '\$${data.likes}0',
                                  rating: '4',
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
              } else if (state.hotelModelList.isEmpty) {
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
                          List.generate(state.hotelModelList.length, (index) {
                        final data = state.hotelModelList[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HotelDetailedWidget(
                                    url: data.urls!.regular!,
                                    title: khotelname[index],
                                    subtitle: 'Londan',
                                    price: '\$${data.likes}0',
                                    rating: '4',
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
                              SizedBox(
                                height: 30,
                                width: size.width / 1.5,
                                child: RatingBar.builder(
                                  itemSize: 40,
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      const EdgeInsets.symmetric(horizontal: 1),
                                  itemBuilder: (context, _) => Transform.scale(
                                    scale:
                                        .4, // Adjust this value to reduce the size
                                    child: const Icon(
                                      Icons.star,
                                      color: kamber,
                                    ),
                                  ),
                                  onRatingUpdate: (double value) {},
                                ),
                              ),
                              ListTile(
                                leading: IconButtonWidget(
                                    onPressFunc: () {},
                                    iconwidget: const Icon(
                                      kLocation,
                                      color: kSubDominantcolor,
                                    )),
                                title: Text(
                                  '\$${data.likes}0',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: SizedBox(
                                    height: 30,
                                    child: Text(data.description ??
                                        'Currently name are unavailable')),
                                trailing: IconButton(
                                    onPressed: () {}, icon: const Icon(ksave)),
                              ),
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
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HotelDetailedWidget(
                              url:
                                  'https://www.connollycove.com/wp-content/uploads/2023/05/people-walking-japan-street-nighttime-2.jpg',
                              title: 'Hotel',
                              subtitle: 'Hotel sub title',
                              price: '\$230',
                              rating: '4',
                              about: 'dfhdf ndfjhfd djfdhfd dfjgfg')));
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
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/ea/77/6c/7132-hotel.jpg?w=700&h=-1&s=1'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  childwidget: h10,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Hotel name',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: size.width,
                                      child: const Center(
                                        child: Text(
                                          'Water is an inorganic compound with the chemical formula H₂O. It is a transparent, tasteless, odorless, and nearly colorless chemical substance, and it is the main constituent of Earth\'s hydrosphere and the fluids of all known living organisms',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: kdominatgrey),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                      width: size.width / 1.5,
                                      child: RatingBar.builder(
                                        itemSize: 30,
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 1),
                                        itemBuilder: (context, _) =>
                                            Transform.scale(
                                          scale:
                                              .4, // Adjust this value to reduce the size
                                          child: const Icon(
                                            Icons.star,
                                            color: kamber,
                                          ),
                                        ),
                                        onRatingUpdate: (double value) {},
                                      ),
                                    ),
                                    const Text(
                                      '\$200',
                                      style: TextStyle(
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
                itemCount: 10,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
