import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travelapp/Application/Hotel&Place_Bloc/hotel_place_bloc.dart';
import 'package:travelapp/Application/HotelBloc/hotel_bloc.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/CircularProgressIndicator.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';
import 'package:travelapp/widgets/IconButton.dart';
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
                              rating: '${data.comments! / 4.toDouble()}',
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
                                child: ConatinerwithWidget(
                                  height: 50,
                                  width: 50,
                                  containerdecoration: BoxDecoration(
                                      color: klightwhite,
                                      borderRadius: BorderRadius.circular(15)),
                                  childwidget: IconButtonWidget(
                                      onPressFunc: () {},
                                      iconwidget: const Icon(
                                        kfavoriteOutline,
                                        color: kDominantcolor,
                                      )),
                                ),
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
                                    RatingBar.builder(
                                      initialRating: data.comments!.toDouble(),
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 1),
                                      itemBuilder: (context, _) =>
                                          Transform.scale(
                                        scale:
                                            .5, // Adjust this value to reduce the size
                                        child: const Icon(
                                          Icons.star,
                                          color: kamber,
                                        ),
                                      ),
                                      onRatingUpdate: (double value) {},
                                    )
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
              'Some Cheaptest',
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
                                rating: '${data.comments! / 4.toDouble()}',
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
