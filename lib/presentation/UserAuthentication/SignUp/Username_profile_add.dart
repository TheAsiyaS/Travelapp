import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/RegExp.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/presentation/UserAuthentication/SignUp/ScreenPassword.dart';
import 'package:travelapp/widgets/NavButtonWidget.dart';

class UsernameProfileAdd extends StatelessWidget {
  const UsernameProfileAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    final TextEditingController usernameController = TextEditingController();
    final ValueNotifier<String> errorText = ValueNotifier('');
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
              child: CupertinoTextField(
                placeholder: 'Username...',
                decoration: const BoxDecoration(),
                placeholderStyle: const TextStyle(color: kgrey),
                style: TextStyle(color: isDarkMode ? kwhite : kblack),
                onChanged: (value) {
                  usernameController.text = value;
                },
              )),
          const Divider(
            color: kdominatgrey,
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
              width: 3,
              size: size,
              text: 'Next',
              color: kDominantcolor,
              onPress: () {
                if (usernameController.text.isEmpty) {
                  errorText.value =
                      'Username is empty .\nIf you want to create a account you must have a username ';
                } else if (!usernameRegex.hasMatch(usernameController.text)) {
                  errorText.value =
                      'We previously informed you that you may exclusively utilize the following characters: (a-z), (0-9), (.), and (_).';
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScreenPassword(
                            username: usernameController.text,
                          )));
                }
              }),
          h10,
          ValueListenableBuilder(
              valueListenable: errorText,
              builder: (context, value, _) {
                return Text(errorText.value);
              }),
          h20,
        ],
      )),
    );
  }
}
