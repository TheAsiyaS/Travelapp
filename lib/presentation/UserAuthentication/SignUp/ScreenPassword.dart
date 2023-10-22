import 'package:flutter/material.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/presentation/UserAuthentication/SignUp/ScreenEmail_phno.dart';
import 'package:travelapp/widgets/CupertinoTextfield.dart';
import 'package:travelapp/widgets/NavButtonWidget.dart';

class ScreenPassword extends StatelessWidget {
  const ScreenPassword({super.key, required this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    final passwordController = TextEditingController();
    final repasswordController = TextEditingController();
    final ValueNotifier<String> errorText = ValueNotifier('');
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
                controller: passwordController,
                placeholderText: 'Password....',
                placeholderStyle: const TextStyle(color: kgrey),
                boxDecoration: const BoxDecoration(),
                prefixWidget: h10,
                suffixWidget: h10,
                keybodtype: TextInputType.name,
                obscureText: true,
                style: TextStyle(color: isDarkMode ? kwhite : kblack),
                onchanged: (value) {},
                onsubmitted: (value) {}),
          ),
          const Divider(
            color: kdominatgrey,
            endIndent: 20,
            indent: 20,
          ),
          h30,
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: CupertinotextfieldWidget(
                controller: repasswordController,
                placeholderText: 'Re-enter....',
                placeholderStyle: const TextStyle(color: kgrey),
                boxDecoration: const BoxDecoration(),
                prefixWidget: h10,
                suffixWidget: h10,
                keybodtype: TextInputType.name,
                obscureText: true,
                style: TextStyle(color: isDarkMode ? kwhite : kblack),
                onchanged: (value) {},
                onsubmitted: (value) {}),
          ),
          const Divider(
            color: kdominatgrey,
            endIndent: 20,
            indent: 20,
          ),
          const Spacer(),
          NavButton(
            width: 3,
            size: size,
            text: 'Next',
            color: kDominantcolor,
            onPress: () {
              if (repasswordController.text.length < 6) {
                errorText.value = 'Password must contain at least 6 characters';
              } else {
                // Check if the password contains at least three special characters
                RegExp specialCharacterPattern =
                    RegExp(r'[!@#\$%^&*()_+{}\[\]:;<>,.?~\\|]');
                Iterable<RegExpMatch> matches = specialCharacterPattern
                    .allMatches(repasswordController.text);

                if (matches.length < 3) {
                  errorText.value =
                      'Password must contain at least three special characters';
                } else {
                  errorText.value = ''; // No errors, password is valid
                  // Navigate to the next screen
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScreenEmailPhno(
                          username: username,
                          password: repasswordController.text)));
                }
              }
            },
          ),
          const Spacer(),
        ],
      )),
    );
  }
}