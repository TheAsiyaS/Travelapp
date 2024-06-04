import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';
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
    final rated = rating.toString();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: ktransparent,
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: IconButtonWidget(
                onPressFunc: () {
                  Navigator.of(context).pop();
                },
                iconwidget: const Icon(
                  kbackward,
                  color: klightwhite,
                  size: 45,
                )),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                ConatinerwithWidget(
                    containerdecoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(imageurl), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20)),
                    childwidget: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          h10,
                          ConatinerwithWidget(
                              containerdecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(suburls[0]),
                                      fit: BoxFit.cover)),
                              childwidget: h10,
                              height: 50,
                              width: 50),
                          ConatinerwithWidget(
                              containerdecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(suburls[1]),
                                      fit: BoxFit.cover)),
                              childwidget: h10,
                              height: 50,
                              width: 50),
                          ConatinerwithWidget(
                              containerdecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(suburls[2]),
                                      fit: BoxFit.cover)),
                              childwidget: h10,
                              height: 50,
                              width: 50),
                        ],
                      ),
                    ),
                    height: size.height / 2,
                    width: size.width),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: size.height / 5.5,
                    width: size.width / 1.3,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(101, 10, 56, 53),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: textstyle,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(kLocation),
                                      Text(
                                        subtitle,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: kDominantTrans,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.stars_rounded,
                                              color: kamber,
                                              size: 20,
                                            ),
                                            Text(
                                              rated[0],
                                              style: const TextStyle(
                                                  color: kwhite),
                                            ),
                                          ],
                                        ),
                                      ),
                                      w10,
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: kDominantTrans,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              kshare,
                                              color: kDominanttextcolor,
                                              size: 20,
                                            ),
                                            Text(
                                              rated,
                                              style: const TextStyle(
                                                  color: kwhite),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    '\$ $price',
                                    style: textstyle,
                                  )
                                ],
                              ),
                            ],
                          ),
                          Text(
                              '$title is the most comfortable place in $subtitle,with affordable price....')
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Text(
              'Review',
              style: textstyle,
            ),
            SizedBox(
                height: size.height / 1.6,
                width: size.width,
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
                        final review = [
                          'Really amazing😍',
                          'So nice 💕💕',
                          'Wonderfull!!!..',
                          'Budget Friendly..😊',
                          'Thank you so much ❤️❤️, I like this place😘'
                        ];
                        review.shuffle();
                        return ListView.separated(
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              final userdata = snapshot.data!.docs[index];
                              return ListTile(
                                leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(userdata['photoUrl'])),
                                title: Text(userdata['username']),
                                subtitle: Text(
                                    review[index % review.length]),
                                trailing: const Icon(kcheck,
                                    color: kSubDominantcolor),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                            itemCount: snapshot.data!.docs.length);
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
