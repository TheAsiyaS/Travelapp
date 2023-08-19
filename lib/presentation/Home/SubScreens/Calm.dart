import 'package:flutter/material.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/IconButton.dart';
import 'package:travelapp/widgets/OnlyImageBox.dart';

class Calm extends StatelessWidget {
  const Calm({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Expanded(
          child: SizedBox(
            height: size.height / 1.5,
            width: size.width,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  height: size.height / 4,
                  width: size.width / 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OnlyimageBoxWidget(
                              height: size.height / 4.5,
                              width: size.width / 2.5,
                              boxdecoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(20.0),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://stunningplaces.net/wp-content/uploads/2014/04/1-The-Maldives-Islands-Photo-by-Vincent-Jary.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              childwidget: h10,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Manali',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                SizedBox(
                                  height: 100,
                                  width: size.width,
                                  child: const Text(
                                    'Water is an inorganic compound with the chemical formula H₂O. It is a transparent, tasteless, odorless, and nearly colorless chemical substance, and it is the main constituent of Earth\'s hydrosphere and the fluids of all known living organisms',
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: kdominatgrey),
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButtonWidget(
                                        onPressFunc: () {},
                                        iconwidget: const Icon(
                                          kLocation,
                                          color: kSubDominantcolor,
                                        )),
                                    const Text('India , Manali',
                                        style: TextStyle(color: kdominatgrey)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: 10,
            ),
          ),
        ),
      ],
    );
  }
}
