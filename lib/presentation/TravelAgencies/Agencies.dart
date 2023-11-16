import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/presentation/TravelAgencies/AgentDeatails.dart';

class Agencies extends StatelessWidget {
  const Agencies({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Agents'),
        backgroundColor: ktransparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          SizedBox(
              height: size.height / 1.09,
              child: FutureBuilder(
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
                      return GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1 / 1,
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
                    }
                  }))
        ],
      ),
    );
  }
}
