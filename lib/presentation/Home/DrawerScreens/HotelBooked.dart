import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/main.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';

class HotelBookedScreen extends StatelessWidget {
  const HotelBookedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    ValueNotifier<List> hotelsname = ValueNotifier([]);
    final PageController pageController = PageController();

    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("BookedHotels")
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
            if (currentuserdata.value.uid != null) {
              List hotelname = snapshot.data!.docs.map((doc) {
                return doc['name'];
              }).toList();

              hotelsname.value.clear();
              hotelsname.value.addAll(hotelname);
            }
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: ktransparent,
                  title:  ValueListenableBuilder<List>(
                valueListenable: hotelsname,
                builder: (context, names, _) {
                  return Text(names.join(', '));
                },
              ),
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
                body: PageView.builder(
                  controller: pageController,
                  onPageChanged: (int index) {
                    // Update hotelsname based on the data of the currently displayed page
                    final data = snapshot.data!.docs[index];
                    List hotelname = [data['name']];
                    hotelsname.value = hotelname;
                  },
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final data = snapshot.data!.docs[index];
                    return ConatinerwithWidget(
                        containerdecoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(data['imageurl']),
                                fit: BoxFit.cover)),
                        childwidget: Padding(
                          padding: const EdgeInsets.only(bottom: 20, left: 5),
                          child: SizedBox(
                              height: size.height / 4,
                              width: size.width,
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                          height: size.height / 7,
                                          width: size.width / 1.3,
                                          decoration: BoxDecoration(
                                              color: kblackTransparent,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 30),
                                                child: ListTile(
                                                  title: Text(
                                                    data['name'],
                                                    style: const TextStyle(
                                                        color: kwhite,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  subtitle: Text(
                                                    data['decription'],
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      color: klightwhite,
                                                    ),
                                                  ),
                                                  trailing: Column(
                                                    children: [
                                                      Text(
                                                        data['rating']
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color: kamber),
                                                      ),
                                                      const Text(
                                                        'Rating',
                                                        style: subtextstyle,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: size.width / 2.7,
                                        top: size.height / 1.39),
                                    child: ConatinerwithWidget(
                                        containerdecoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    data['imageurl']))),
                                        childwidget: h10,
                                        height: 100,
                                        width: 200),
                                  ),
                                ],
                              )),
                        ),
                        height: size.height,
                        width: size.width);
                  },
                ));
          }
        });
  }
}
