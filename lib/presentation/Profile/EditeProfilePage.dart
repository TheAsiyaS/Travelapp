import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelapp/Domain/DB/Infrastructure/Auhentication/UserAuthentication.dart';
import 'package:travelapp/common/Functions/UserAuthFunction.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/main.dart';
import 'package:travelapp/presentation/UserAuthentication/SignUp/Username_profile_add.dart';
import 'package:travelapp/widgets/CupertinoTextfield.dart';
import 'package:travelapp/widgets/ElevatedbuttonWidget.dart';

class EiteProfile extends StatelessWidget {
  const EiteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ChangeNotifierProvider<UsernameModel>(
        create: (context) => UsernameModel(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Edite profile '),
          ),
          body: Consumer<UsernameModel>(builder: (context, model, _) {
            return SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      await model.selectImage();
                      if (model.imageBytes != null) {
                        await AuthMethod()
                            .uploadProfileImage(file: model.imageBytes);
                        model.notifyListeners();
                      } else {
                        // Handle case when imageBytes is null
                      }
                    },
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          NetworkImage(currentuserdata.value.photoUrl),
                    ),
                  ),
                ),
                const Text('Username'),
                CupertinotextfieldWidget(
                    placeholderText: currentuserdata.value.username,
                    placeholderStyle: subtextstyle,
                    boxDecoration: const BoxDecoration(),
                    prefixWidget: w2,
                    suffixWidget: w2,
                    keybodtype: TextInputType.name,
                    obscureText: false,
                    style: const TextStyle(color: kwhite),
                    onchanged: (value) {},
                    onsubmitted: (value) {},
                    controller: model.usernameController),
                const Divider(
                  color: klightwhite,
                ),
                const Text('name'),
                CupertinotextfieldWidget(
                    placeholderText: currentuserdata.value.name.isEmpty
                        ? "Name"
                        : currentuserdata.value.name,
                    placeholderStyle: subtextstyle,
                    boxDecoration: const BoxDecoration(),
                    prefixWidget: w2,
                    suffixWidget: w2,
                    keybodtype: TextInputType.name,
                    obscureText: false,
                    style: const TextStyle(color: kwhite),
                    onchanged: (value) {},
                    onsubmitted: (value) {},
                    controller: model.nameController),
                const Divider(
                  color: klightwhite,
                ),
                const Text('Email'),
                CupertinotextfieldWidget(
                    placeholderText: currentuserdata.value.email,
                    placeholderStyle: subtextstyle,
                    boxDecoration: const BoxDecoration(),
                    prefixWidget: w2,
                    suffixWidget: w2,
                    keybodtype: TextInputType.name,
                    obscureText: false,
                    style: const TextStyle(color: kwhite),
                    onchanged: (value) {},
                    onsubmitted: (value) {},
                    controller: model.emailController),
                const Divider(
                  color: klightwhite,
                ),
                const Text('Phone Number'),
                CupertinotextfieldWidget(
                    placeholderText: currentuserdata.value.phoneNumber.isEmpty
                        ? "No number"
                        : currentuserdata.value.phoneNumber,
                    placeholderStyle: subtextstyle,
                    boxDecoration: const BoxDecoration(),
                    prefixWidget: w2,
                    suffixWidget: w2,
                    keybodtype: TextInputType.name,
                    obscureText: false,
                    style: const TextStyle(color: kwhite),
                    onchanged: (value) {},
                    onsubmitted: (value) {},
                    controller: model.phNOController),
                const Divider(
                  color: klightwhite,
                ),
                const Center(child: Text('data')),
                Center(
                  child: SizedBox(
                    height: size.height / 12,
                    width: size.width / 1.5,
                    child: ElevatedButtonWidget(
                        onPress: () async {
                          ValueNotifier<String> resultph = ValueNotifier('');
                          if (currentuserdata.value.phoneNumber.isEmpty &&
                              model.phNOController.text.isEmpty) {
                            resultph.value = 'ok';
                            resultph.notifyListeners();
                          } else {
                            resultph.value = phonenocheck(
                                phoneNumber: model.phNOController.text.isEmpty
                                    ? currentuserdata.value.phoneNumber
                                    : model.phNOController.text);
                            resultph.notifyListeners();
                          }
                          final result = emailcheck(
                              email: model.emailController.text.isEmpty
                                  ? currentuserdata.value.email
                                  : model.emailController.text);

                          final resultusername = usernamecheck(
                            username: model.usernameController.text.isEmpty
                                ? currentuserdata.value.username
                                : model.usernameController.text,
                          );
                          if (resultph.value != 'ok' ||
                              result != 'ok' ||
                              resultusername != 'ok') {
                            print('${resultph.value} $result $resultusername');
                          } else {
                            await AuthMethod().updateUserndata(
                                username: model.usernameController.text.isEmpty
                                    ? currentuserdata.value.username
                                    : model.usernameController.text,
                                name: model.nameController.text.isEmpty
                                    ? currentuserdata.value.name
                                    : model.nameController.text,
                                email: model.emailController.text.isEmpty
                                    ? currentuserdata.value.email
                                    : model.emailController.text,
                                phoneno: model.phNOController.text.isEmpty
                                    ? currentuserdata.value.phoneNumber
                                    : model.phNOController.text);
                            currentuserdata.value =
                                await AuthMethod().getUserDetail();
                            currentuserdata.notifyListeners();
                            Navigator.of(context).pop();
                          }
                        },
                        buttonwidget: const Text(
                          'Save Changes',
                          style: TextStyle(fontSize: 20, color: kwhite),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kDominantcolor,
                        )),
                  ),
                ),
              ],
            ));
          }),
        ));
  }
}
