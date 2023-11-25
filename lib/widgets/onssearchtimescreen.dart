import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/presentation/Home/SearchResult.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';
import 'package:travelapp/widgets/CupertinoTextfield.dart';
import 'package:travelapp/widgets/IconButton.dart';

class OnsearchtimeScreen extends StatelessWidget {
  const OnsearchtimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final placeController = TextEditingController();
    ValueNotifier<String> searchvalue =
        ValueNotifier('Search your hapiness......');
    final searchplacesabout = [
      'on the coast of the Persian Gulf',
      'in the continent of Asia',
      'located in South Asia'
    ];
    final searchplacesname = ['Dubai', 'India', 'maldives'];
    final searchplacesimage = [
      'https://lp-cms-production.imgix.net/features/2017/09/dubai-marina-skyline-2c8f1708f2a1.jpg',
      'https://www.g20.org/content/dam/gtwenty/gtwenty_new/explore_india/Culture%20Heritage%20of%20India_1.jpg',
      'https://media2.thrillophilia.com/images/photos/000/082/497/original/1675261154_shutterstock_2148766633.jpg?width=975&height=600'
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ConatinerwithWidget(
                  height: 50,
                  width: 50,
                  containerdecoration: BoxDecoration(
                      color: kwhite, borderRadius: BorderRadius.circular(15)),
                  childwidget: IconButtonWidget(
                      onPressFunc: () {},
                      iconwidget: const Icon(
                        kiconsearch,
                        color: kdominatgrey,
                      )),
                ),
                ConatinerwithWidget(
                    containerdecoration: const BoxDecoration(),
                    childwidget: ValueListenableBuilder(
                      valueListenable: searchvalue,
                      builder: (context, value,_) {
                        return CupertinotextfieldWidget(
                            controller: placeController,
                            onchanged: (value) {},
                            onsubmitted: (value) {
                               searchvalue.value =value;
                          searchvalue.notifyListeners();
                              log(value);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SearchResult(
                                        querry: searchvalue.value,
                                      )));
                            },
                            placeholderText: searchvalue.value,
                            placeholderStyle: const TextStyle(color: kdominatgrey),
                            boxDecoration: BoxDecoration(
                                color: kwhite,
                                borderRadius: BorderRadius.circular(15)),
                            prefixWidget: w10,
                            suffixWidget: h10,
                            keybodtype: TextInputType.name,
                            obscureText: false,
                            style: const TextStyle());
                      }
                    ),
                    height: 50,
                    width: size.width / 1.2)
              ],
            ),
            const Text(
              'Recent searchs',
              style: textstyle,
            ),
            ConatinerwithWidget(
                containerdecoration: const BoxDecoration(),
                childwidget: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          placeController.text = searchplacesname[index];
                          searchvalue.value = searchplacesname[index];
                          searchvalue.notifyListeners();
                        },
                        leading: ConatinerwithWidget(
                            containerdecoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(searchplacesimage[index]),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            childwidget: h10,
                            height: 50,
                            width: 50),
                        title: Text(searchplacesname[index]),
                        subtitle: Text(searchplacesabout[index]),
                        trailing: IconButtonWidget(
                            onPressFunc: () {},
                            iconwidget: const Icon(
                              kclose,
                              color: kDominanttextcolor,
                            )),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: 3),
                height: size.height / 1.5,
                width: size.width)
          ],
        ),
      ),
    );
  }
}
