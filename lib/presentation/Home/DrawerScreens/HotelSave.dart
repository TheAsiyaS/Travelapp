import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/Domain/DB/Infrastructure/FirestoreMethod.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/main.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';
import 'package:travelapp/widgets/ElevatedbuttonWidget.dart';
import 'package:travelapp/widgets/IconButton.dart';
import 'package:travelapp/widgets/RatingBar.dart';

class SavedHotels extends StatefulWidget {
  const SavedHotels({super.key});

  @override
  State<SavedHotels> createState() => _SavedHotelsState();
}

class _SavedHotelsState extends State<SavedHotels> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final PageController pageController = PageController();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: ktransparent,
          leading: IconButtonWidget(
              onPressFunc: () {
                Navigator.of(context).pop();
              },
              iconwidget: const Icon(
                kbackward,
                color: kdominatgrey,
                size: 35,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                height: 50,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: kdominatgrey,
                ),
                child: Center(
                  child: Text(
                    'Emarald',
                    style: GoogleFonts.dancingScript(
                        color: const Color.fromARGB(255, 190, 225, 254)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
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
                    child: Text('Some error occurred!!'),
                  );
                } else if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text('Currently you have no Saved Hotels'),
                  );
                } else {
                  return PageView.builder(
                    controller: pageController,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final data = snapshot.data!.docs[index];
                      return ConatinerwithWidget(
                        containerdecoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(data['imageurl']),
                            fit: BoxFit.cover,
                          ),
                        ),
                        childwidget: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ConatinerwithWidget(
                              containerdecoration: const BoxDecoration(
                                color: kblackTransparent,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                ),
                              ),
                              childwidget: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data['name'],
                                    style: const TextStyle(
                                        color: kwhite,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    "\$${data['price']}",
                                    style: const TextStyle(
                                        color: kwhite,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: size.width / 2,
                                    child: RatingBar(
                                      intialvalue: data['rating'],
                                      height: 50,
                                      width: size.width,
                                      scrolldirection: Axis.horizontal,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        height: 45,
                                        width: 150,
                                        child: ElevatedButtonWidget(
                                          onPress: () {},
                                          buttonwidget: const Text(
                                            'More Info',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 190, 225, 254),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: kDominantTrans,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 45,
                                        width: 150,
                                        child: ElevatedButtonWidget(
                                          onPress: () {},
                                          buttonwidget: const Text(
                                            'More Info',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 190, 225, 254),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: kDominantTrans,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    height: 50,
                                    width: size.width / 1.5,
                                    child: ElevatedButtonWidget(
                                      onPress: () async {
                                        // Go back one page
                                        await pageController.nextPage(
                                          duration: const Duration(seconds: 1),
                                          curve: Curves.bounceIn,
                                        );
                                        await FirestoreMethods()
                                            .deleteHotelSaved(
                                          hotelId: data['hotelId'],
                                        );
                                      },
                                      buttonwidget: Text(
                                        'Booked',
                                        style: GoogleFonts.dancingScript(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: const Color.fromARGB(
                                              255, 190, 225, 254),
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: kDominantTrans,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              height: size.height / 2.5,
                              width: size.width,
                            ),
                          ],
                        ),
                        height: size.height,
                        width: size.width,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
