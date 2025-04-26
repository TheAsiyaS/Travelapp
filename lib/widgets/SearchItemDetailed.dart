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
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
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
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: size.height / 1.6,
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

