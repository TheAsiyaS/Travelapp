import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/Application/Hotel&Place_Bloc/hotel_place_bloc.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/Appbar.dart';
import 'package:travelapp/widgets/CircularProgressIndicator.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';
import 'package:travelapp/widgets/RatingBar.dart';

import '../../widgets/SearchItemDetailed.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key, required this.querry});
  final String querry;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotelPlaceBloc>(context)
          .add(HotelPlaceEvent.getSearchPlaceDetails(searchQuery: querry));
    });
    final size = MediaQuery.of(context).size;
    final places = [
      'Paris, France',
      'New York City, USA',
      'Tokyo, Japan',
      'Rome, Italy',
      'Rio de Janeiro, Brazil',
      'Sydney, Australia',
      'Cairo, Egypt',
      'Istanbul, Turkey',
      'Barcelona, Spain',
      'Bangkok, Thailand',
    ];
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(size.height / 7),
            child: SimpleAppbar(
              size: size,
              id: 'searchInHome',
            )),
        body: BlocBuilder<HotelPlaceBloc, HotelPlaceState>(
            builder: (context, state) {
          if (state.isLoading == true) {
            return const WidgetCircularProgressIndicator(
                indicatorColor: kdominatgrey);
          } else if (state.iserror == true) {
            return const Text('Some error occured');
          } else if (state.placesearch.isEmpty) {
            return const Center(child: Text('No Data found'));
          } else {
            return GridView.count(
              crossAxisCount: 1,
              childAspectRatio: 1 / 1,
              mainAxisSpacing: 20,
              children: List.generate(10, (index) {
                final data = state.placesearch[index];
                final List<String> imagesUrl = [
                  state.placesearch[0].largeImageUrl!,
                  state.placesearch[1].largeImageUrl!,
                  state.placesearch[2].largeImageUrl!,
                  state.placesearch[3].largeImageUrl!,
                  state.placesearch[4].largeImageUrl!,
                  state.placesearch[5].largeImageUrl!,
                ];
                imagesUrl.shuffle();
                return Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SearchItemDetailed(
                                imageurl: data.largeImageUrl!,
                                suburls: imagesUrl ,
                                price: '${data.imageHeight! / 5}',
                                title: places[index % places.length],
                                subtitle: '',
                                rating: '${data.comments! / 4.toDouble()}',
                                reviewNo: '${data.comments!}',
                                obj: '')));
                      },
                      child: ConatinerwithWidget(
                          containerdecoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(data.largeImageUrl!),
                                fit: BoxFit.cover),
                          ),
                          childwidget: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: size.height / 4,
                                width: size.width,
                                decoration: const BoxDecoration(
                                    color: kDominantTrans,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(500),
                                        topRight: Radius.circular(500))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                               EdgeInsets.only(left:size.width/5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                places[index % places.length],
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: kwhite),
                                              ),
                                              SizedBox(
                                                height: 50,
                                                width: size.width / 1.7,
                                                child: Text(
                                                  'About the ${places[index % places.length]} and surrounding areas are most beautiful and safe',
                                                  style: subtextstyle,
                                                  maxLines: 3,
                                                ),
                                              ),
                                              Text(
                                                '${data.imageHeight! / 5}',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                    color: kwhite),
                                              ),
                                              const Row(
                                                children: [
                                                  Icon(
                                                    kLocation,
                                                    color: kdominatgrey,
                                                  ),
                                                  Text(
                                                    'Location',
                                                    style: subtextstyle,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        RatingBar(
                                      intialvalue: data.comments!,
                                      height: size.height /6,
                                      width: size.width / 5, 
                                      scrolldirection: Axis.vertical),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          height: size.height / 1,
                          width: size.width),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        h10,
                        ConatinerwithWidget(
                            containerdecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(imagesUrl[0]),
                                    fit: BoxFit.cover)),
                            childwidget: h10,
                            height: 50,
                            width: 50),
                        ConatinerwithWidget(
                            containerdecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(imagesUrl[1]),
                                    fit: BoxFit.cover)),
                            childwidget: h10,
                            height: 50,
                            width: 50),
                        ConatinerwithWidget(
                            containerdecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(imagesUrl[2]),
                                    fit: BoxFit.cover)),
                            childwidget: h10,
                            height: 50,
                            width: 50),
                      ],
                    )
                  ],
                );
              }),
            );
          }
        }));
  }
}
