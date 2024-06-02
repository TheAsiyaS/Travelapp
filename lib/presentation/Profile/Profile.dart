import 'package:flutter/material.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/main.dart';
import 'package:travelapp/presentation/Profile/EditeProfilePage.dart';
import 'package:travelapp/widgets/IconButton.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: ValueListenableBuilder(
            valueListenable: currentuserdata,
            builder: (context, value, _) {
              return Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(currentuserdata.value.photoUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  color: kblackTransparent,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: size.height / 2,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: kDominantTransdark,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: CircleAvatar(
                                radius: 60,
                                backgroundImage: currentuserdata
                                        .value.scondaryImage.isEmpty
                                    ? const AssetImage('asset/noImage.jpg')
                                        as ImageProvider<Object>?
                                    : NetworkImage(
                                        currentuserdata.value.scondaryImage),
                              )),
                              const Text(
                                'Username',
                                style:
                                    TextStyle(letterSpacing: 5, color: kwhite),
                              ),
                              Text(
                                currentuserdata.value.username,
                                style: const TextStyle(
                                    color: klightwhite, fontSize: 18),
                              ),
                              const Text(
                                'Name',
                                style:
                                    TextStyle(letterSpacing: 5, color: kwhite),
                              ),
                              Text(
                                currentuserdata.value.name.isEmpty
                                    ? 'Unavailable'
                                    : currentuserdata.value.name,
                                style: const TextStyle(
                                    color: klightwhite, fontSize: 18),
                              ),
                              const Text(
                                'Bio',
                                style:
                                    TextStyle(letterSpacing: 5, color: kwhite),
                              ),
                              Text(
                                currentuserdata.value.bio.isEmpty
                                    ? 'Unavailable'
                                    : currentuserdata.value.bio,
                                style: const TextStyle(
                                    color: klightwhite, fontSize: 18),
                              ),
                              const Text(
                                'Location',
                                style:
                                    TextStyle(letterSpacing: 5, color: kwhite),
                              ),
                              Text(
                                currentuserdata.value.acLocation!.isEmpty
                                    ? 'Asia,India'
                                    : currentuserdata.value.acLocation!,
                                style: const TextStyle(
                                    color: klightwhite, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: size.width / 1.3,
                        ),
                        child: Center(
                          child: IconButtonWidget(
                              onPressFunc: () {
                                Navigator.of(context).pop();
                              },
                              iconwidget: const Icon(
                                kbackward,
                                color: klightwhite,
                                size: 45,
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width / 1.3,
                        ),
                        child: Center(
                          child: IconButtonWidget(
                              onPressFunc: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const EiteProfile()));
                              },
                              iconwidget: const Icon(
                                kforward,
                                color: klightwhite,
                                size: 45,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
