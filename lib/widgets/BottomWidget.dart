
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/common/Sizedboxes.dart';

import '../common/colours.dart';
import 'ElevatedbuttonWidget.dart';

class BottomprivacyPolicy extends StatelessWidget {
  const BottomprivacyPolicy({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 6,
      width: size.width,
      color: kbottomSubDominant,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Longitude',
                style: GoogleFonts.dancingScript(fontSize: 20),
              ),
              Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asset/logo.png'),
                        fit: BoxFit.cover)),
              ),
              ElevatedButtonWidget(
                  onPress: () {},
                  buttonwidget: const Row(
                    children: [Icon(Icons.language), w10, Text('English')],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kbottomSubDominant,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                          color: kDominantcolor,
                          width: 2.0), // Border properties
                    ),
                  ))
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Privacy',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  h10,
                  Text(
                    'About us',
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Policy',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  h10,
                  Text(
                    'About us',
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    'Help',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  h10,
                  Text(
                    'About us',
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BottomWidgettop extends StatelessWidget {
  const BottomWidgettop({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 4,
      width: size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30)),
        color: kDominantcolor,
      ),
      child: Column(children: [
        SizedBox(
          height: 40,
          width: size.width,
          child: ElevatedButtonWidget(
              onPress: () {},
              buttonwidget: const Text('Back to top'),
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                backgroundColor: kbottomSubDominant,
              )),
        ),
        h20,
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  'Get Know us',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
                h10,
                Text('About us',
                    style: TextStyle(color: kDominanttextcolor)),
                h10,
                Text('About us',
                    style: TextStyle(color: kDominanttextcolor)),
                h10,
                Text('About us',
                    style: TextStyle(color: kDominanttextcolor))
              ],
            ),
            Column(
              children: [
                Text(
                  'Contact us',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.4),
                ),
                h10,
                Text('About us',
                    style: TextStyle(color: kDominanttextcolor)),
                h10,
                Text('About us',
                    style: TextStyle(color: kDominanttextcolor)),
                h10,
                Text('About us',
                    style: TextStyle(color: kDominanttextcolor))
              ],
            ),
          ],
        )
      ]),
    );
  }
}
