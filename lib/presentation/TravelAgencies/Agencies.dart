import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/Functions/dateget.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/colours.dart';

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
            children: [
              Container(
                height: size.height / 1.5,
                width: size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4H7LormyHhqenNDsLXtlVdLJdISsrRpJBJv_LT_MwkqKOdEMDagj5parjn-eyL2FJxoU&usqp=CAU'),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        date,
                        style: GoogleFonts.lora(color: kwhite, fontSize: 20),
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
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Meet Our Trusted Tourist Guides \nExplore with confidence! Our friendly and experienced tourist guides are here to make your journey unforgettable.",
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
            ],
          ),
        ));

    // }
    // }),
    //);
  }
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
