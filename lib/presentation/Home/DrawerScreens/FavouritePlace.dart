import 'package:flutter/material.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
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
                child: ListView.separated(
                    itemBuilder: (context, index) {
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
                                  const Text(
                                    'Place Name',
                                    style: textstyle,
                                  ),
                                  w20,
                                  ConatinerwithWidget(
                                      containerdecoration: BoxDecoration(
                                          color: kDominantTransdark,
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  15)),
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
                                      containerdecoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: const DecorationImage(
                                              image: NetworkImage(
                                                  'https://geographical.co.uk/wp-content/uploads/Photographing-mountains-in-spring-1200x800.jpg'),
                                              fit: BoxFit.cover)),
                                      childwidget: h10,
                                      height: size.height / 6,
                                      width: size.width / 2),
                                  const Column(
                                    children: [
                                      Text(
                                        '\$934',
                                        style: textstyle,
                                      ),
                                      SizedBox(
                                          height: 50,
                                          width: 150,
                                          child: Text(
                                              'Descriptin about the place want to visit '))
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
                    itemCount: 10),
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
  }
}
