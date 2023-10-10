import 'package:flutter/material.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/CupertinoTextfield.dart';
import 'package:travelapp/widgets/NavButtonWidget.dart';

class ScreenPassword extends StatelessWidget {
  const ScreenPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Text(
            'Choose your Password',
            style: textstyle,
          ),
          h10,
          const Text( 
            'Required (you can change it later).\n \n* Minimum 6 characters\n* Must include special characters',
            style: subtextstyle,
          ),
          h30,
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: CupertinotextfieldWidget(
                placeholderText: 'Password....',
                placeholderStyle: const TextStyle(color: klightwhite),
                boxDecoration: const BoxDecoration(),
                prefixWidget: h10,
                suffixWidget: h10,
                keybodtype: TextInputType.name,
                obscureText: true,
                style: const TextStyle(color: kwhite),
                onchanged: (value) {},
                onsubmitted: (value) {}),
          ),
          const Divider(
            color: klightwhite,
            endIndent: 20,
            indent: 20,
          ),
          h30,
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: CupertinotextfieldWidget(
                placeholderText: 'Re-enter....',
                placeholderStyle: const TextStyle(color: klightwhite),
                boxDecoration: const BoxDecoration(),
                prefixWidget: h10,
                suffixWidget: h10,
                keybodtype: TextInputType.name,
                obscureText: true,
                style: const TextStyle(color: kwhite),
                onchanged: (value) {},
                onsubmitted: (value) {}),
          ),
          const Divider(
            color: klightwhite,
            endIndent: 20,
            indent: 20,
          ),
          const Spacer(),
          NavButton(
              size: size,
              text: 'Next',
              color: kDominantcolor,
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ScreenPassword()));
              }),
          const Spacer(),
        ],
      )),
    );
  }
}
