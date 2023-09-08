import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/Appbar.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';

import '../../widgets/SearchItemDetailed.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(size.height / 7),
            child: SimpleAppbar(
              size: size,
              id: 'searchInHome',
            )),
        body: GridView.count(
          crossAxisCount: 1,
          childAspectRatio: 1 / 1,
          mainAxisSpacing: 20,
          children: List.generate(
              10,
              (index) => Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SearchItemDetailed(
                                  imageurl: '',
                                  suburls: [],
                                  price: '',
                                  title: '',
                                  subtitle: '',
                                  rating: '',
                                  reviewNo: '',
                                  obj: '')));
                        },
                        child: ConatinerwithWidget(
                            containerdecoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://d27k8xmh3cuzik.cloudfront.net/wp-content/uploads/2017/12/shutterstock_7024083491.jpg'),
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
                                                const EdgeInsets.only(left: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Explore item title',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                  width: size.width / 1.7,
                                                  child: const Text(
                                                    'About the hotel and surrounding areas information here',
                                                    style: subtextstyle,
                                                    maxLines: 3,
                                                  ),
                                                ),
                                                const Text(
                                                  '\$5060',
                                                  style: textstyle,
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
                                              direction: Axis.vertical,
                                              itemSize: 15,
                                              initialRating: 3,
                                              ratingWidget: RatingWidget(
                                                  full: const Icon(
                                                    kstarsfilled,
                                                    color: kamber,
                                                  ),
                                                  half: const Icon(kstars),
                                                  empty: const Icon(kstars)),
                                              onRatingUpdate: (value) {})
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
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                          'https://hips.hearstapps.com/hmg-prod/images/harpers-ferry-west-virginia-royalty-free-image-1660073165.jpg'),
                                      fit: BoxFit.cover)),
                              childwidget: h10,
                              height: 50,
                              width: 50),
                          ConatinerwithWidget(
                              containerdecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                          'https://hips.hearstapps.com/hmg-prod/images/harpers-ferry-west-virginia-royalty-free-image-1660073165.jpg'),
                                      fit: BoxFit.cover)),
                              childwidget: h10,
                              height: 50,
                              width: 50),
                          ConatinerwithWidget(
                              containerdecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                          'https://www.edreams.pt/blog/wp-content/uploads/sites/4/2017/03/Seoul-coreia-primavera.jpg'),
                                      fit: BoxFit.cover)),
                              childwidget: h10,
                              height: 50,
                              width: 50),
                        ],
                      )
                    ],
                  )),
        ));
  }
}
