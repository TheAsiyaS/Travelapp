import 'package:flutter/material.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/CircularProgressIndicator.dart';
import 'package:travelapp/widgets/SearchItemDetailed.dart';
import 'package:travelapp/Application/Hotel&Place_Bloc/hotel_place_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Beach extends StatelessWidget {
  const Beach({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotelPlaceBloc>(context)
          .add(const HotelPlaceEvent.beach());
    });
    final places = [
      'Grace Bay, Turks and Caicos',
      'Baia do Sancho, Brazil',
      'Varadero Beach, Cuba',
      'Eagle Beach, Aruba',
      'Seven Mile Beach, Cayman Islands',
      'La Concha Beach, Spain',
      'Clearwater Beach, Florida, USA',
      'Seven Mile Beach, Negril, Jamaica',
      'Anse Lazio, Praslin, Seychelles',
      'Pink Sands Beach, Harbour Island, Bahamas',
    ];
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<HotelPlaceBloc, HotelPlaceState>(
              builder: (context, state) {
            if (state.isLoading == true) {
              return const WidgetCircularProgressIndicator(
                  indicatorColor: kdominatgrey);
            } else if (state.iserror == true) {
              return const Text('Some error occured');
            } else if (state.beach.isEmpty) {
              return const Center(child: Text('No Data found'));
            } else {
              return SizedBox(
                height: size.height / 3,
                width: size.width,
                child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1 / 1.2,
                    children: List.generate(10, (index) {
                      final data = state.beach[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SearchItemDetailed(
                                  imageurl: data.largeImageUrl!,
                                  suburls: const [],
                                  price: "${data.imageHeight}.3",
                                  title: places[index % places.length],
                                  subtitle:
                                      ' With its powdery white sands and crystal-clear turquoise waters, Grace Bay is a tropical paradise perfect for sunbathing and water sports.',
                                  rating: data.comments!,
                                  reviewNo: '${data.comments}',
                                  obj: 'obj')));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(data.largeImageUrl!),
                                    fit: BoxFit.cover)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: size.height / 9,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                        color: kDominantTrans,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            places[index % places.length],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: kwhite,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          const SizedBox(
                                            height: 40,
                                            child: Text(
                                              ' With its powdery white sands and crystal-clear turquoise waters, Grace Bay is a tropical paradise perfect for sunbathing and water sports.',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: kwhite,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      );
                    })),
              );
            }
          }),
        ),
      ],
    );
  }
}
