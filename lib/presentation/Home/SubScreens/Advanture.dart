import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:travelapp/Application/Hotel&Place_Bloc/hotel_place_bloc.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/colours.dart';
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
                                  suburls: [],
                                  price: "${data.comments}0",
                                  title: places[index % places.length],
                                  subtitle:
                                      ' rope climbing exercises, obstacle courses, bouldering, rock climbing, target oriented activities, and zip-lines. They are usually intended for recreation.',
                                  rating:  data.comments!,
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
                                    ConatinerwithWidget(
                                        height: 50,
                                        width: 50,
                                        containerdecoration: BoxDecoration(
                                            color: klightwhite,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        childwidget: const Icon(
                                          kfavorite,
                                          color: kDominantcolor,
                                        )),
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
