import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/RegExp.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/presentation/UserAuthentication/SignUp/ScreenPassword.dart';
import 'package:travelapp/widgets/NavButtonWidget.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class UsernameModel extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final TextEditingController phNOController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final ValueNotifier<String> errorText = ValueNotifier('');
  final ValueNotifier<String> username = ValueNotifier('');
  Uint8List? imageBytes;
  bool? isProfile = false;
  void setUsername(String value) {
    username.value = value;
  }

  Future<void> selectImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    log('image file $image');

    if (image != null) {
      imageBytes = await image.readAsBytes();
      isProfile = true;
    } else {
      isProfile = false;
    }
    notifyListeners();
  }
}

class UsernameProfileAdd extends StatelessWidget {
  const UsernameProfileAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UsernameModel>(
      create: (context) => UsernameModel(),
      child: Scaffold(
        body: SafeArea(
          child: Consumer<UsernameModel>(
            builder: (context, model, _) {
              final size = MediaQuery.of(context).size;
              Brightness brightness = MediaQuery.of(context).platformBrightness;
              bool isDarkMode = brightness == Brightness.dark;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  const Text(
                    'Select your Username',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  h10,
                  const Text(
                    'Required (you can change it later).\n You can only use (a-z), (0-9) (._)',
                    style: TextStyle(fontSize: 14),
                  ),
                  h30,
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: CupertinoTextField(
                      placeholder: 'Username...',
                      decoration: const BoxDecoration(),
                      placeholderStyle: const TextStyle(color: kgrey),
                      style: TextStyle(color: isDarkMode ? kwhite : kblack),
                      controller: model.usernameController,
                      onChanged: (value) {
                        model.setUsername(value);
                      },
                      onSubmitted: (value) {
                        model.setUsername(value);
                      },
                    ),
                  ),
                  const Divider(
                    color: kgrey,
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
                  GestureDetector(
                    onTap: () {
                      model.selectImage();
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: kDominantcolor,
                      child: model.imageBytes != null
                          ? CircleAvatar(
                              backgroundImage: MemoryImage(model.imageBytes!),
                              radius: 50,
                            )
                          : const Align(
                              alignment: Alignment.bottomRight,
                              child: Icon(
                                kaddRound,
                                size: 30,
                              )),
                    ),
                  ),
                  const Spacer(),
                  NavButton(
                      width: 3,
                      size: size,
                      text: 'Next',
                      color: kDominantcolor,
                      onPress: () {
                        if (model.username.value.isEmpty) {
                          model.errorText.value =
                              'Username is empty .\nIf you want to create a account you must have a username ';
                        } else if (!usernameRegex
                            .hasMatch(model.username.value)) {
                          model.errorText.value =
                              'We previously informed you that you may exclusively utilize the following characters: (a-z), (0-9), (.), and (_).';
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ScreenPassword(
                                    username: model.username.value,
                                    imageFile: model.imageBytes,
                                  )));
                        }
                      }),
                  h10,
                  ValueListenableBuilder(
                    valueListenable: model.errorText,
                    builder: (context, value, _) {
                      return Text(value);
                    },
                  ),
                  h20,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
