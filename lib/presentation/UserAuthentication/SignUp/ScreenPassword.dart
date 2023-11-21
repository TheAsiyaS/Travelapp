import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:travelapp/common/Functions/UserAuthFunction.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/presentation/UserAuthentication/SignUp/ScreenEmail_phno.dart';
import 'package:travelapp/widgets/CupertinoTextfield.dart';
import 'package:travelapp/widgets/NavButtonWidget.dart';
import 'package:provider/provider.dart';

class PasswordModel extends ChangeNotifier {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();
  final ValueNotifier<String> errorText = ValueNotifier('');

  void validatePasswordAndNavigate(
      BuildContext context, String username, Uint8List? imagefile) {
    final result = passwordcheck(password: repasswordController.text);
    if (result != 'ok') {
      errorText.value = result;
    } else {
      errorText.value = '';
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ScreenEmailPhno(
                username: username,
                password: repasswordController.text,
                imageFile: imagefile,
              )));
    }
  }
}

class ScreenPassword extends StatelessWidget {
  final String username;
  final Uint8List? imageFile;
  const ScreenPassword(
      {required this.username, super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PasswordModel>(
      create: (context) => PasswordModel(),
      child: Scaffold(
        body: SafeArea(
          child: Consumer<PasswordModel>(
            builder: (context, model, _) {
              final size = MediaQuery.of(context).size;
              Brightness brightness = MediaQuery.of(context).platformBrightness;
              bool isDarkMode = brightness == Brightness.dark;

              return Column(
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
                      controller: model.passwordController,
                      placeholderText: 'Password....',
                      boxDecoration: const BoxDecoration(),
                      placeholderStyle: const TextStyle(color: kgrey),
                      prefixWidget: h10,
                      suffixWidget: h10,
                      keybodtype: TextInputType.name,
                      obscureText: true,
                      style: TextStyle(color: isDarkMode ? kwhite : kblack),
                      onchanged: (value) {},
                      onsubmitted: (value) {},
                    ),
                  ),
                  const Divider(
                    color: kgrey,
                    endIndent: 20,
                    indent: 20,
                  ),
                  h30,
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: CupertinotextfieldWidget(
                      controller: model.repasswordController,
                      placeholderText: 'Re-enter....',
                      boxDecoration: const BoxDecoration(),
                      placeholderStyle: const TextStyle(color: kgrey),
                      prefixWidget: h10,
                      suffixWidget: h10,
                      keybodtype: TextInputType.name,
                      obscureText: true,
                      style: TextStyle(color: isDarkMode ? kwhite : kblack),
                      onchanged: (value) {},
                      onsubmitted: (value) {},
                    ),
                  ),
                  const Divider(
                    color: kgrey,
                    endIndent: 20,
                    indent: 20,
                  ),
                  const Spacer(),
                  NavButton(
                    color: kDominantcolor,
                    size: size,
                    width: 3,
                    onPress: () {
                      model.validatePasswordAndNavigate(
                          context, username, imageFile);
                    },
                    text: 'Next',
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
