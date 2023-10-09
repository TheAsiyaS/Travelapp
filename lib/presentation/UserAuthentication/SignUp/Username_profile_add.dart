import 'package:flutter/material.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/CupertinoTextfield.dart';
import 'package:travelapp/widgets/NavButtonWidget.dart';

class UsernameProfileAdd extends StatelessWidget {
  const UsernameProfileAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Text(
            'Select your Username',
            style: textstyle,
          ),
          h10,
          const Text(
            'Required (you can change it later).\n You can only use (a-z),(0-9)(. _)',
            style: subtextstyle,
          ),
          h30,
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: CupertinotextfieldWidget(
                placeholderText: 'Username....',
                placeholderStyle: const TextStyle(color: klightwhite),
                boxDecoration: const BoxDecoration(),
                prefixWidget: h10,
                suffixWidget: h10,
                keybodtype: TextInputType.name,
                obscureText: false,
                style: const TextStyle(),
                onchanged: (value) {},
                onsubmitted: (value) {}),
          ),
          const Divider(
            color: klightwhite,
            endIndent: 20,
            indent: 20,
          ),
          const Spacer(),
          const Text(
            'Select Profile Image',
            style: textstyle,
          ),
          h10,
          const Text(
            'Optional(you can change it later)',
            style: subtextstyle,
          ),
          h30,
          const CircleAvatar(
            radius: 50,
            backgroundColor: kDominantcolor,
            child: Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  kaddRound,
                  size: 30,
                )),
          ),
          const Spacer(),
          NavButton(
              size: size, text: 'Next', color: kDominantcolor, onPress: () {}),
          h30
        ],
      )),
    );
  }
}
