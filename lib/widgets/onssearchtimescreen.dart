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
                    childwidget: CupertinotextfieldWidget(
                      controller: placeController,
                        onchanged: (value) {},
                        onsubmitted: (value) {  
                          log(value);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SearchResult(querry: value,)));
                        },
                        placeholderText: 'Search your hapiness......',
                        placeholderStyle: const TextStyle(color: kdominatgrey),
                        boxDecoration: BoxDecoration(
                            color: kwhite,
                            borderRadius: BorderRadius.circular(15)),
                        prefixWidget: w10,
                        suffixWidget: h10,
                        keybodtype: TextInputType.name,
                        obscureText: false,
                        style: const TextStyle()),
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
                        leading: ConatinerwithWidget(
                            containerdecoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://www.studentuniverse.com/blog/wp-content/uploads/2014/04/Santorini-Greece.jpg'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            childwidget: h10,
                            height: 50,
                            width: 50),
                        title: const Text('Search Place'),
                        subtitle: const Text('About that place'),
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
                    itemCount: 10),
                height: size.height / 1.5,
                width: size.width)
          ],
        ),
      ),
    );
  }
}
