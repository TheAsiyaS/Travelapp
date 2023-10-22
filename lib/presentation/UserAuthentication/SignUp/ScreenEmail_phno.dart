import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/presentation/NavigationBar.dart';
import 'package:travelapp/widgets/CupertinoTextfield.dart';
import 'package:travelapp/widgets/NavButtonWidget.dart';

class ScreenEmailPhno extends StatelessWidget {
  const ScreenEmailPhno(
      {super.key, required this.username, required this.password});
  final String username;
  final String password;

  @override
  Widget build(BuildContext context) {
    print('username : $username passsword $password');
    final size = MediaQuery.of(context).size;
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    final emailController = TextEditingController();
    ValueNotifier<String> gphonenumber = ValueNotifier('');
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Spacer(),
          const Text(
            'E-mail',
            style: textstyle,
          ),
          h10,
          const Text(
            'Required (you can\'t change it later).',
            style: subtextstyle,
          ),
          h30,
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: CupertinotextfieldWidget(
                controller:emailController ,
                placeholderText: 'Enter E-mail....',
                placeholderStyle: const TextStyle(color: kgrey),
                boxDecoration: const BoxDecoration(),
                prefixWidget: h10,
                suffixWidget: h10,
                keybodtype: TextInputType.name,
                obscureText: false,
                style: TextStyle(color: isDarkMode ? kwhite : kblack),
                onchanged: (value) {
                  emailController.text = value;
                },
                onsubmitted: (value) { emailController.text = value;}),
          ),
          const Divider(
            color: kdominatgrey,
            endIndent: 20,
            indent: 20,
          ),
          h30,
          const Spacer(),
          const Text(
            'Phone Number add (optional)',
            style: textstyle,
          ),
          h10,
          const Text(
            'If you want to be the angent of our app',
            style: subtextstyle,
          ),
          h30,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IntlPhoneField(
              //controller: phonNoController,
              decoration: const InputDecoration(
                  hintText: 'Phone Number',
                  border: OutlineInputBorder(),
                  fillColor: kDominantTrans,
                  filled: true),
              onSubmitted: (phoneNumber) {
                log("PhoneNumber-----$phoneNumber");
                if (phoneNumber.isEmpty || phoneNumber.length < 10) {
                  gphonenumber.value = 'Incorrect Phone number';
                } else {
                  gphonenumber.value = phoneNumber;
                }
              },
              onChanged: (value) {
                log(value.number);
                gphonenumber.value = value.number;
              },
            ),
          ),
          NavButton(
              size: size,
              text: 'Complete Sign-Up',
              color: kDominantcolor,
              width: 2,
              onPress: () async {
                if (!emailController.text.contains('@gmail.com')) {
                  log('incorrect email');
                } else if (EmailValidator.validate(emailController.text) ==
                    false) {
                  log('inavlid email');
                } else {
                  // await AuthMethod().signUp(
                  //     email: emailController.text,
                  //     password: password,
                  //     phoneNo: gphonenumber.value,
                  //     username: username,
                  //     bio: '');
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const NavigationBarScreen()));
                }
              }),
          const Spacer(),
        ],
      )),
    );
  }
}
