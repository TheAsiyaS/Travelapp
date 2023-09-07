import 'package:flutter/material.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/IconButton.dart';

import 'widgets/ContainerWithWidget.dart';

class some extends StatelessWidget {
  const some({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
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
        )
      ],
    );
  }
}
