import 'package:flutter/material.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/IconButton.dart';

class SearchItemDetailed extends StatelessWidget {
  const SearchItemDetailed(
      {super.key,
      required this.imageurl,
      required this.suburls,
      required this.price,
      required this.title,
      required this.subtitle,
      required this.rating,
      required this.reviewNo,
      required this.obj});

  final String imageurl;

  final List<String> suburls;
  final String price;
  final String title;
  final String subtitle;
  final int rating;
  final String reviewNo;
  final String obj;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final rate = reduceToOneDigit(rating);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 144, 161, 162),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: ktransparent,
          leading: CircleAvatar(
            radius: 45,
            backgroundColor: kblackTransparent,
            child: IconButtonWidget(
                onPressFunc: () {
                  Navigator.of(context).pop();
                },
                iconwidget: const Icon(
                  kbackward,
                  color: Color.fromARGB(255, 133, 145, 144),
                  size: 35,
                )),
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                color: kblackTransparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: kblack,
                    child: Icon(
                      Icons.sunny,
                      color: kamber,
                    ),
                  ),
                  w10,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sunny',
                        style: TextStyle(color: kwhite),
                      ),
                      Text('15*c', style: TextStyle(color: kwhite))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: size.height / 1.7,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            imageurl,
                          ),
                          fit: BoxFit.cover)),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        const Color.fromARGB(136, 0, 0, 0),
                        ktransparent
                      ]),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Share $rating',
                            style: TextStyle(
                              color: kwhite,
                              fontSize: 20,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          Text(
                            title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                                color: kwhite),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: kDominantTransdark,
                                backgroundImage: NetworkImage(suburls[0]),
                              ),
                              SizedBox(
                                height: 20,
                                child: VerticalDivider(
                                  color: kwhite,
                                  thickness: 2,
                                ),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: kDominantTransdark,
                                backgroundImage: NetworkImage(suburls[1]),
                              ),
                              SizedBox(
                                height: 20,
                                child: VerticalDivider(
                                  color: kwhite,
                                  thickness: 2,
                                ),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: kDominantTransdark,
                                backgroundImage: NetworkImage(suburls[2]),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height / 9,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: size.height / 25,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: kblack,
                    radius: 40,
                    child: Icon(
                      kfavorite,
                      color: kdominatgrey,
                      size: 35,
                      weight: 2,
                    ),
                  )),
            ],
          ),
          // Text.rich(
          //   TextSpan(
          //     children: [
          //       WidgetSpan(
          //         alignment: PlaceholderAlignment.middle,
          //         child: Icon(Icons.area_chart, size: 28, color: kblack),
          //       ),
          //       TextSpan(
          //         text: ' $subtitle',
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 25,
          //           color: kblack,
          //         ),
          //       ),
          //     ],
          //   ),
          //   textAlign: TextAlign.center,
          //   maxLines: 1,
          //   overflow: TextOverflow.ellipsis,
          // ),
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(Icons.area_chart, size: 28, color: kblack),
                ),
                TextSpan(
                  text: ' $subtitle',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: kblack,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: kblack,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  width: size.width / 3,
                  child: Divider(
                    color: kdominatgrey,
                  )),
              Icon(
                Icons.hive_sharp,
                color: kdominatgrey,
              ),
              SizedBox(
                  width: size.width / 3,
                  child: Divider(
                    color: kdominatgrey,
                  )),
            ],
          ),
          Text(
            textAlign: TextAlign.center,
            'Discover the beauty, culture, and unique experiences this destination has to offer. From breathtaking views to rich traditions, every moment here creates unforgettable memories.\n',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: const Color.fromARGB(255, 44, 72, 71)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 40,
                width: 70,
                decoration: BoxDecoration(
                    color: kDominantTrans,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(
                  '10+ hr',
                  style: TextStyle(
                      color: kwhite, fontSize: 15, fontWeight: FontWeight.bold),
                )),
              ),
              Container(
                  height: 40,
                  width: 110,
                  decoration: BoxDecoration(
                      color: kDominantTrans,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.all_inclusive_rounded,
                        color: const Color.fromARGB(255, 164, 220, 218),
                      ),
                      Text(
                        '100 Km',
                        style: TextStyle(
                            color: kwhite,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kDominantTrans,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        kstarsfilled,
                        size: 17,
                        color: const Color.fromARGB(255, 164, 220, 218),
                      ),
                      Text(
                        '${rate}/10',
                        style: TextStyle(
                            color: kwhite,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
            ],
          ),
          h20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'starting from ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: kblack),
                  ),
                  Text(
                    '\$$price.23',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: kblack),
                  ),
                ],
              ),
              SizedBox(
                  height: size.height / 10,
                  child: VerticalDivider(color: kdominatgrey)),
              Column(
                children: [
                  Text(
                    '$rating+',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: kblack),
                  ),
                  Text(
                    'Reviews',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: kblack),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

int reduceToOneDigit(int number) {
  while (number >= 10) {
    number = number.toString().split('').map(int.parse).reduce((a, b) => a + b);
  }
  return number;
}
