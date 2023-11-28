import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/main.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';
import 'package:travelapp/widgets/ElevatedbuttonWidget.dart';
import 'package:travelapp/widgets/RatingBar.dart';

class SavedHotels extends StatelessWidget {
  const SavedHotels({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ktransparent,
          actions: [
            Container(
              height: 20,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: kdominatgrey,
              ),
              child: Center(
                child: Text(
                  'Emarald',
                  style: GoogleFonts.dancingScript(),
                ),
              ),
            )
          ],
        ),
        extendBodyBehindAppBar: true,
        body: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("SavedHotels")
                .where('userid', isEqualTo: currentuserdata.value.uid)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: kwhite,
                  ),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Some error occured!!'),
                );
              } else if (snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text('Currently you have no Favourite places'),
                );
              } else {
                return PageView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final data = snapshot.data!.docs[index];
                    return ConatinerwithWidget(
                        containerdecoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(data['imageurl']),
                                fit: BoxFit.cover)),
                        childwidget: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ConatinerwithWidget(
                                containerdecoration: const BoxDecoration(
                                    color: kblackTransparent,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(40),
                                        topRight: Radius.circular(40))),
                                childwidget: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      data['name'],
                                      style: textstyle,
                                    ),
                                    Text(
                                      "\$${data['price']}",
                                      style: textstyle,
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: size.width / 2,
                                      child: RatingBar(
                                          intialvalue: data['rating'],
                                          height: 50,
                                          width: size.width,
                                          scrolldirection: Axis.horizontal),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          height: 45,
                                          width: 100,
                                          child: ElevatedButtonWidget(
                                              onPress: () {},
                                              buttonwidget:
                                                  const Text('More Info',style: TextStyle(color:   Color.fromARGB(
                                                    255, 190, 225, 254))),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      kDominantTrans)),
                                        ),
                                        SizedBox(
                                          height: 45,
                                          width: 100,
                                          child: ElevatedButtonWidget(
                                              onPress: () {},
                                              buttonwidget:
                                                  const Text('More Info',style: TextStyle(color:   Color.fromARGB(
                                                    255, 190, 225, 254)),),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      kDominantTrans)),
                                        )
                                      ],
                                    ),
                                    h20,
                                    SizedBox(
                                      height: 50,
                                      width: size.width / 1.5,
                                      child: ElevatedButtonWidget(
                                          onPress: () {},
                                          buttonwidget: Text(
                                            'Booked',
                                            style: GoogleFonts.dancingScript(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                                color: const Color.fromARGB(
                                                    255, 190, 225, 254)),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: kDominantTrans)),
                                    )
                                  ],
                                ),
                                height: size.height / 2.5,
                                width: size.width),
                          ],
                        ),
                        height: size.height,
                        width: size.width);
                  },
                );
              }
            }));
  }
}
