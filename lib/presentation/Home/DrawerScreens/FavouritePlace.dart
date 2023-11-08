import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/main.dart';
import 'package:travelapp/widgets/AdvitismentCard.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';

class FavouritePlaces extends StatelessWidget {
  const FavouritePlaces({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Heading',
                style: textstyle,
              ),
              const Divider(),
              SizedBox(
                height: size.height / 1.1,
                width: size.width,
                child: FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection("SavedPlaces")
                        .where('userid', isEqualTo: currentuserdata.uid)
                        .get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator(
                          strokeWidth: 2,
                          color: kwhite,
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
                        return ListView.separated(
                            itemBuilder: (context, index) {
                              final data = snapshot.data!.docs[index];
                              return Card(
                                elevation: 10,
                                child: SizedBox(
                                  height: size.height / 4,
                                  width: size.width / 2,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            data['name'],
                                            style: textstyle,
                                          ),
                                          w20,
                                          ConatinerwithWidget(
                                              containerdecoration: BoxDecoration(
                                                  color: kDominantTransdark,
                                                  borderRadius:
                                                      BorderRadiusDirectional
                                                          .circular(15)),
                                              childwidget: IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    kfavorite,
                                                    color: kdominatgrey,
                                                  )),
                                              height: 50,
                                              width: 50)
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          ConatinerwithWidget(
                                              containerdecoration:
                                                  BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              data['imageurl']),
                                                          fit: BoxFit.cover)),
                                              childwidget: h10,
                                              height: size.height / 6,
                                              width: size.width / 2),
                                          Column(
                                            children: [
                                              Text(
                                                "\$${data['price']}",
                                                style: textstyle,
                                              ),
                                              SizedBox(
                                                  height: 50,
                                                  width: 150,
                                                  child: Text(
                                                    data['decription'],
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ))
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                            itemCount: snapshot.data!.docs.length);
                      }
                    }),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height / 18),
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Adcard(isDarkMode: isDarkMode, size: size),
                ConatinerwithWidget(
                    containerdecoration: BoxDecoration(
                        color: kDominantTransdark,
                        borderRadius: BorderRadiusDirectional.circular(50)),
                    childwidget: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          kclose,
                          color: kdominatgrey,
                        )),
                    height: 40,
                    width: 40)
              ],
            ),
          )
        ],
      )),
    );
  } //https://youtu.be/OMKDBXi8fcI?si=S0tUxbnDDNglA1wQ
}
