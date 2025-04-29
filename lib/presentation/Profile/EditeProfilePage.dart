import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelapp/Domain/DB/Infrastructure/Auhentication/UserAuthentication.dart';
import 'package:travelapp/common/Functions/UserAuthFunction.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/main.dart';
import 'package:travelapp/presentation/Profile/AvatarFlip.dart';
import 'package:travelapp/presentation/UserAuthentication/SignUp/Username_profile_add.dart';
import 'package:travelapp/widgets/CupertinoTextfield.dart';
import 'package:travelapp/widgets/ElevatedbuttonWidget.dart';
import 'package:travelapp/widgets/IconButton.dart';

class BottomRightTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.60);
    path.lineTo(size.width * 0.02, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class EiteProfile extends StatelessWidget {
  const EiteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ValueNotifier<String> errorText = ValueNotifier('');
    final titleText = [
      'Username',
      'Name',
      'Bio',
      'Email',
      'Phone Number',
      'Location',
      
    ];
    final fieldplaceholder = [
      currentuserdata.value.username,
      currentuserdata.value.name.isEmpty ? "Name" : currentuserdata.value.name,
      currentuserdata.value.bio.isEmpty
          ? "You haven't provided a bio yet."
          : currentuserdata.value.bio,
      currentuserdata.value.email,
      currentuserdata.value.phoneNumber.isEmpty
          ? "No number"
          : currentuserdata.value.phoneNumber,
      'Location',
      
    ];
    final keyboardType = [
      TextInputType.name,
      TextInputType.name,
      TextInputType.name,
      TextInputType.name,
      TextInputType.number,
      TextInputType.name,
    ];
    final fieldTrailingIcon = [
      kperson,
      kperson,
      knote,
      kmail,
      kcall,
      kLocation,
      
    ];
    return ChangeNotifierProvider<UsernameModel>(
        create: (context) => UsernameModel(),
        child: Scaffold(
          appBar: AppBar(
            foregroundColor: kwhite,
            title: const Text('Edit Profile'),
            centerTitle: true,
            backgroundColor: ktransparent,
            actions: [
              IconButtonWidget(
                  onPressFunc: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const FlipAvatarPage()));
                  },
                  iconwidget: const Icon(
                    ksetting,
                  ))
            ],
          ),
          extendBodyBehindAppBar: true,
          body: Consumer<UsernameModel>(builder: (context, model, _) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      ClipPath(
                        clipper: BottomRightTriangleClipper(),
                        child: GestureDetector(
                          onTap: () async {
                            await model.selectImage();
                            if (model.imageBytes != null) {
                              await AuthMethod()
                                  .uploadSecondaryImage(file: model.imageBytes);
                              model.notifyListeners();
                            } else {
                              // Handle case when imageBytes is null
                            }
                          },
                          child: Container(
                              height: size.height / 2.5,
                              width: size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: currentuserdata
                                          .value.scondaryImage.isEmpty
                                      ? const AssetImage('asset/noImage.jpg')
                                          as ImageProvider<Object>
                                      : NetworkImage(
                                          currentuserdata.value.scondaryImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Container(
                                color: kDominantTrans,
                              )),
                        ),
                      ),
                      GestureDetector(
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
                          child: const FlipAvatarPage()),
                    ],
                  ),
                  h20,
                  SizedBox(
                    width: size.width,
                    height: size.height / 1.86,
                    child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          final Fieldcontrollers = [
                            model.usernameController,
                            model.nameController,
                            model.bioController,
                            model.emailController,
                            model.phNOController,
                            model.locationController,
                          ];
                          return Container(
                            decoration: BoxDecoration(
                                color: kDominantTransdark,
                                borderRadius: BorderRadius.circular(10)),
                            height: 70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("  ${titleText[index]}"),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: CupertinotextfieldWidget(
                                      placeholderText: fieldplaceholder[index],
                                      placeholderStyle: subtextstyle,
                                      boxDecoration: const BoxDecoration(),
                                      prefixWidget: w2,
                                      suffixWidget:
                                          Icon(fieldTrailingIcon[index]),
                                      keybodtype: keyboardType[index],
                                      obscureText: false,
                                      style: const TextStyle(color: kgrey),
                                      onchanged: (value) {},
                                      onsubmitted: (value) {},
                                      controller: Fieldcontrollers[index]),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: kDominantTransdark,
                          );
                        },
                        itemCount: 6),
                  ),
                  ValueListenableBuilder(
                      valueListenable: errorText,
                      builder: (context, value, _) {
                        return Center(child: Text(errorText.value));
                      }),
                ]),
                SizedBox(
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
                          if (resultph.value != 'ok') {
                            errorText.value = resultph.value;
                          } else if (result != 'ok') {
                            errorText.value = resultph.value;
                          } else if (resultusername != 'ok') {
                            errorText.value = result;
                          }
                        } else {
                          errorText.value = '';
                          await AuthMethod().updateUserndata(
                              bio: model.bioController.text.isEmpty
                                  ? currentuserdata.value.bio
                                  : model.bioController.text,
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
                        backgroundColor: const Color.fromARGB(188, 8, 44, 33),
                      )),
                ),
              ],
            );
          }),
        ));
  }
}
