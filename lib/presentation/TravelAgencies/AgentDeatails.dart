import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';
import 'package:travelapp/widgets/IconButton.dart';

class AgentDetails extends StatelessWidget {
  const AgentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agent Name'),
        backgroundColor: ktransparent,
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConatinerwithWidget(
              containerdecoration: BoxDecoration(),
              childwidget: h10,
              height:100,
              width: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Phone Number: 1234567890',
                style: TextStyle(fontSize: 18),
              ),
              IconButtonWidget(
                  onPressFunc: () {},
                  iconwidget: const Icon(
                    kcall,
                    color: kSubDominantcolor,
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Email: abcxyz@gamil.com',
                style: TextStyle(fontSize: 18),
              ),
              IconButtonWidget(
                  onPressFunc: () {},
                  iconwidget: const Icon(
                    kcall,
                    color: kSubDominantcolor,
                  )),
            ],
          ),
        ],
      )),
    );
  }
}
