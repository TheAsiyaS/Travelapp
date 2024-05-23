import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:travelapp/Domain/DB/Infrastructure/Auhentication/UserAuthentication.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/main.dart';
import 'package:travelapp/presentation/Profile/EditeProfilePage.dart';
import 'package:travelapp/presentation/UserAuthentication/SignUp/Username_profile_add.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';
import 'package:travelapp/widgets/ElevatedbuttonWidget.dart';
import 'package:travelapp/widgets/IconButton.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  Future<Uint8List> loadImage(String imageUrl) async {
    try {
      final response = await Dio().get<List<int>>(
        imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );
      return Uint8List.fromList(response.data!);
    } catch (e) {
      print('Error loading image: $e');
      return Uint8List(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<UsernameModel>(
        create: (context) => UsernameModel(),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: ktransparent,
            ),
            extendBodyBehindAppBar: true,
            body: Consumer<UsernameModel>(
              builder: (context, model, _) {
                String imageUrl = currentuserdata.value.scondaryImage;

                return Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(currentuserdata.value.photoUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ValueListenableBuilder(
                      valueListenable: currentuserdata,
                      builder: (context, value, _) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FutureBuilder<Uint8List>(
                                future: loadImage(imageUrl),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    if (snapshot.hasError) {
                                      print(
                                          'Error loading image: ${snapshot.error}');
                                    } else {
                                      model.imageBytes = snapshot.data!;
                                    }
                                  }

                                  return Padding(
                                    padding:
                                        EdgeInsets.only(left: size.width / 9),
                                    child: GestureDetector(
                                      onTap: () async {
                                        await model.selectImage();
                                        if (model.imageBytes != null) {
                                          await AuthMethod()
                                              .uploadSecondaryImage(
                                                  file: model.imageBytes);
                                          model.notifyListeners();
                                        } else {
                                          // Handle case when imageBytes is null
                                        }
                                      },
                                      child: snapshot.connectionState ==
                                              ConnectionState.waiting
                                          ? const CircularProgressIndicator(
                                              color: kdominatgrey,
                                              strokeWidth: 2,
                                            )
                                          : CircleAvatar(
                                              radius: 70,
                                              backgroundImage: model
                                                          .imageBytes !=
                                                      null
                                                  ? MemoryImage(
                                                      model.imageBytes!)
                                                  : const AssetImage(
                                                         'asset/noImage.jpg')
                                                      as ImageProvider<Object>,
                                            ),
                                    ),
                                  );
                                }),
                            Text(
                              currentuserdata.value.username,
                              style: textstyle,
                            ),
                            Text(
                              currentuserdata.value.name.isEmpty
                                  ? 'name'
                                  : currentuserdata.value.name,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButtonWidget(
                                    onPressFunc: () {},
                                    iconwidget: const Icon(
                                      kLocation,
                                    )),
                                const Text(
                                  'Asia,India',
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height / 10,
                              width: size.width / 2,
                              child: Text(
                                currentuserdata.value.bio,
                                style: subtextstyle,
                              ),
                            ),
                            const Divider(
                              color: kSubDominantcolor,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kDominantTrans,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "Contact me",
                                      style: GoogleFonts.dancingScript(
                                          fontSize: 27, color: kwhite),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            bool? res =
                                                await FlutterPhoneDirectCaller
                                                    .callNumber(
                                              currentuserdata.value.phoneNumber,
                                            );
                                            print(res);
                                          },
                                          child: ConatinerwithWidget(
                                            containerdecoration: BoxDecoration(
                                              color: kDominantcolor,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            childwidget: const Icon(
                                              kcall,
                                              color: kDominanttextcolor,
                                            ),
                                            height: 50,
                                            width: 50,
                                          ),
                                        ),
                                        ConatinerwithWidget(
                                          containerdecoration: BoxDecoration(
                                            color: kDominantcolor,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          childwidget: const Icon(
                                            kmail,
                                            color: kDominanttextcolor,
                                          ),
                                          height: 50,
                                          width: 50,
                                        ),
                                      ],
                                    ),
                                    h10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          currentuserdata.value.phoneNumber,
                                          style: subtextstyle,
                                        ),
                                        Text(currentuserdata.value.email,
                                            style: subtextstyle),
                                      ],
                                    ),
                                    h20,
                                  ],
                                ),
                              ),
                            ),
                            Center(
                              child: SizedBox(
                                height: size.height / 12,
                                width: size.width / 1.3,
                                child: ElevatedButtonWidget(
                                    onPress: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const EiteProfile()));
                                    },
                                    buttonwidget: Text(
                                      'Edite account',
                                      style: GoogleFonts.crimsonText(
                                          fontSize: 27, color: kwhite),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kDominantcolor,
                                    )),
                              ),
                            ),
                          ],
                        );
                      }),
                );
              },
            )));
  }
}
