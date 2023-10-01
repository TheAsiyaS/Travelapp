import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/Application/Hotel&Place_Bloc/hotel_place_bloc.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/presentation/Home/Home.dart';
import 'package:travelapp/widgets/CircularProgressIndicator.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';
import 'package:travelapp/widgets/OnlyImageBox.dart';
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
                return const Text('Some error occured');
              } else if (state.popular.isEmpty) {
                return const Text('No Data found');
              } else {
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final data = state.popular[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SearchItemDetailed(
                                  imageurl: '',
                                  suburls: [],
                                  price: 'price',
                                  title: 'title',
                                  subtitle: 'subtitle',
                                  rating: 'rating',
                                  reviewNo: 'reviewNo',
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '',
                                    style: textstyle,
                                  ),
                                  const Row(
                                    children: [
                                      Icon(kLocation),
                                      Text(
                                        'Location',
                                      ),
                                    ],
                                  ),
                                  ratingbar,
                                  h20,
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ConatinerwithWidget(
                                      containerdecoration: BoxDecoration(
                                          color: klightwhite,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      childwidget: const Icon(
                                        kfavorite,
                                        color: kDominantcolor,
                                      ),
                                      height: 50,
                                      width: 50),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: SizedBox(
                                      height: size.height / 4,
                                      width: 50,
                                      child: ListView.separated(
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (context, index) {
                                            return OnlyimageBoxWidget(
                                                height: 50,
                                                width: 50,
                                                boxdecoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            homeimageurls[
                                                                index]),
                                                        fit: BoxFit.fill)),
                                                childwidget: const Column(
                                                  children: [],
                                                ));
                                          },
                                          separatorBuilder: (context, index) {
                                            return h20;
                                          },
                                          itemCount: homeimageurls.length),
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
