import 'dart:developer';
import 'dart:typed_data';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:travelapp/Domain/DB/Infrastructure/Auhentication/UserAuthentication.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/presentation/NavigationBar.dart';
import 'package:travelapp/widgets/CupertinoTextfield.dart';
import 'package:travelapp/widgets/NavButtonWidget.dart';
import 'package:provider/provider.dart';

class EmailPhoneModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final ValueNotifier<String> gPhoneNumber = ValueNotifier('');

  void validateAndNavigate(BuildContext context, String username,
      String password, Uint8List? imageFile) async {
    if (!emailController.text.contains('@gmail.com')) {
      log('Incorrect email');
    } else if (!EmailValidator.validate(emailController.text)) {
      log('Invalid email');
    } else {
      final result = await AuthMethod().signUp(
          email: emailController.text,
          password: password,
          phoneNo: gPhoneNumber.value,
          username: username,
          bio: '',
          file: imageFile);
      if (result == 'ok') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const NavigationBarScreen(),
        ));
      } else {
        log('some error occured');
      }
      // Navigate to the next screen after successful signup
    }
  }
}

class ScreenEmailPhno extends StatelessWidget {
  final String username;
  final String password;
  final Uint8List? imageFile;
  const ScreenEmailPhno(
      {super.key,
      required this.username,
      required this.password,
      required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EmailPhoneModel>(
      create: (context) => EmailPhoneModel(),
      child: Scaffold(
        body: SafeArea(
          child: Consumer<EmailPhoneModel>(
            builder: (context, model, _) {
              final size = MediaQuery.of(context).size;
              Brightness brightness = MediaQuery.of(context).platformBrightness;
              bool isDarkMode = brightness == Brightness.dark;

              return Column(
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
                      controller: model.emailController,
                      placeholderText: 'Enter E-mail....',
                      boxDecoration: const BoxDecoration(),
                      placeholderStyle: const TextStyle(color: kgrey),
                      prefixWidget: h10,
                      suffixWidget: h10,
                      keybodtype: TextInputType.name,
                      obscureText: false,
                      style: TextStyle(color: isDarkMode ? kwhite : kblack),
                      onchanged: (value) {
                        model.emailController.text = value;
                      },
                      onsubmitted: (value) {
                        model.emailController.text = value;
                      },
                    ),
                  ),
                  const Divider(
                    color: kgrey,
                    endIndent: 20,
                    indent: 20,
                  ),
                  h30,
                  const Text(
                    'Phone Number add (optional)',
                    style: textstyle,
                  ),
                  h10,
                  const Text(
                    'If you want to be the agent of our app',
                    style: subtextstyle,
                  ),
                  h30,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: IntlPhoneField(
                      decoration: const InputDecoration(
                        hintText: 'Phone Number',
                        border: OutlineInputBorder(),
                        fillColor: kgreyTransparent,
                        filled: true,
                      ),
                      onSubmitted: (phoneNumber) {
                        if (phoneNumber.isEmpty || phoneNumber.length < 10) {
                          model.gPhoneNumber.value = 'Incorrect Phone number';
                        } else {
                          model.gPhoneNumber.value = phoneNumber;
                        }
                      },
                      onChanged: (value) {
                        model.gPhoneNumber.value = value.number;
                      },
                    ),
                  ),
                  NavButton(
                    size: size,
                    text: 'Complete Sign-Up',
                    color: kDominantcolor, // Change to your preferred color
                    width: 2,
                    onPress: () {
                      model.validateAndNavigate(
                          context, username, password, imageFile);
                    },
                  ),
                  const Spacer(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
