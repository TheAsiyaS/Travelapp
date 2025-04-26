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

