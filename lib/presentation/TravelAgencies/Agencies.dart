import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/Functions/dateget.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/ElevatedbuttonWidget.dart';

class Agencies extends StatelessWidget {
  const Agencies({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //Brightness brightness = MediaQuery.of(context).platformBrightness;
    final date = dateget();

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 152, 168, 169),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height / 1.5,
                width: size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4H7LormyHhqenNDsLXtlVdLJdISsrRpJBJv_LT_MwkqKOdEMDagj5parjn-eyL2FJxoU&usqp=CAU',
                        ),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        date,
                        style:
                            GoogleFonts.bodoniModa(color: kwhite, fontSize: 25),
                      ),
                    ),
                    Divider(
                      color: kwhite,
                      thickness: 2.3,
                    ),
                    h10,
                    Container(
                      height: size.height / 6,
                      width: size.width / 1.1,
                      color: const Color.fromARGB(157, 77, 77, 77),
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(20),
                        child: Text(
                          "Meet Our Trusted Tourist Guides \nExplore with confidence! Our friendly and experienced tourist guides are here to make your journey unforgettable.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: kwhite),
                        ),
                      ),
                    ),
                    h50,
                  ],
                ),
              ),
              h20,
              Text(
                ' WE have',
                style: GoogleFonts.bodoniModa(
                    color: kwhite, fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                ' 30+ Agents',
                style: GoogleFonts.oldStandardTt(
                  fontSize: 45,
                  color: kDominantcolor,
                ),
              ),
              Text(
                ' They are here to guide you through a world of wonders.',
                textAlign: TextAlign.center,
                style: GoogleFonts.oldStandardTt(
                  color: kwhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
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
              h20,
              Container(
                height: size.height / 19,
                width: size.width,
                color: kDominantcolor,
                child: Center(
                  child: Text(
                    'Today available Guides',
                    style: GoogleFonts.bodoniModa(color: kwhite, fontSize: 25),
                  ),
                ),
              ),
              h40,
              SizedBox(
                height: size.height / 2,
                width: size.width,
                child: GridView.count(
                    crossAxisCount: 1,
                    childAspectRatio: 1.3,
                    mainAxisSpacing: 10,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(20, (index) {
                      return Stack(
                        children: [
                          Container(
                            height: size.height / 2,
                            width: size.width / 1.1,
                            color: const Color.fromARGB(255, 52, 81, 80),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomPaint(
                                  painter: CustomTBorderPainter(
                                      color: const Color.fromARGB(
                                          255, 177, 185, 186)),
                                  child: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: ClipPath(
                                      clipper: Agentcardclip(),
                                      child: Container(
                                        height: size.height / 2.3,
                                        width: index < 9
                                            ? size.width / 1.5
                                            : size.width / 1.3,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                227, 96, 114, 116),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5))),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  child: Text(
                                                    '${index + 1}',
                                                    style:
                                                        GoogleFonts.bodoniModa(
                                                            color: const Color
                                                                .fromARGB(255,
                                                                155, 172, 174),
                                                            fontSize: 70),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: index < 9 ? 20 : 30),
                                                  child: Container(
                                                    height: size.height / 4,
                                                    width: size.width / 2,
                                                    decoration: BoxDecoration(
                                                        color: kDominantcolor,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        100),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        100)),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                              'https://media.gettyimages.com/id/2025430042/photo/portrait-of-female-airport-staff-member.jpg?s=612x612&w=gi&k=20&c=vfLk59PgDOm7EvxFD2bL2Z58U18fSbk8aptMGyVz7qQ=',
                                                            ),
                                                            fit: BoxFit.cover)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Username',
                                              style: textstyle,
                                            ),
                                            Text('1234355678'),
                                            Text('user1234@gmail.com'),
                                            h10,
                                            ElevatedButtonWidget(
                                                onPress: () {},
                                                buttonwidget: Text(
                                                  'Know more',
                                                  style: TextStyle(
                                                    color: kwhite,
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: kblack))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              bottom: size.height / 5,
                              left: size.width / 1.5,
                              child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: kblack,
                                  child: Icon(
                                    kstarsfilled,
                                    color: kamber,
                                  )))
                        ],
                      );
                    })),
              )
            ],
          ),
        ));

    // }
    // }),
    //);
  }
}

class Agentcardclip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Start at the top left corner
    path.moveTo(0, 0);

    // Draw a line to the bottom left corner
    path.lineTo(0, size.height);

    // Draw a line to the bottom right corner
    path.lineTo(size.width, size.height);

    // Draw a line back to the top right corner
    path.lineTo(size.width, size.width / 3);

    // Create the triangular cut out at the top right
    path.lineTo(size.width * 0.02,
        0); // Adjust the value to control the size of the triangle

    // Move back to the top left corner to close the path
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomTBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  CustomTBorderPainter({this.color = Colors.white, this.strokeWidth = 2});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double centerX = size.width * 0.17;

    // Draw vertical line
    canvas.drawLine(Offset(centerX, 0), Offset(centerX, size.height), paint);

    // Draw horizontal line from the vertical line outward
    canvas.drawLine(Offset(0, size.height * 0.18),
        Offset(size.width, size.height * 0.18), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/*


FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("user")
              .where('phoneNumber', isNotEqualTo: '')
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: kdominatgrey,
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: kRed,
                ),
              );
            } else {
              return










GridView.count(
                crossAxisCount: 1,
               // crossAxisSpacing: 10,
                mainAxisSpacing: 0,
               // childAspectRatio: 1 / 1,
                children:
                    List.generate(snapshot.data!.docs.length, (index) {
                  final userdata = snapshot.data!.docs[index];
            
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AgentDetails(
                              imageurl: userdata['photoUrl'],
                              rating: '3',
                              phoneNumber: userdata['phoneNumber'],
                              email: userdata['email'],
                              username: userdata['username'])));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: size.height / 8,
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
                                    userdata['username'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    userdata['phoneNumber'],
                                  ),
                                  Text(userdata['email'],
                                      style: TextStyle(
                                          color: isDarkMode
                                              ? kdominatgrey
                                              : klightwhite)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              );
 */
