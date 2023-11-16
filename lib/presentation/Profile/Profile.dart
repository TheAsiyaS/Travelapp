import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/ImageUrls.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/main.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ktransparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipPath(
                clipper: WaveClipperTwo(
                  flip: true,
                ),
                child: Container(
                  height: size.height / 2,
                  width: size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(currentuserdata.photoUrl),
                          fit: BoxFit.cover)),
                  child: Container(
                    color: const Color.fromARGB(122, 34, 54, 55),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width / 9),
                child: const CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(userprofileImage),
                ),
              ),
            ],
          ),
          Text(
            currentuserdata.username,
            style: textstyle,
          ),
          Text(
            currentuserdata.name,
          ),
          SizedBox(
            height: size.height / 10,
            width: size.width / 2,
            child: Text(
              currentuserdata.bio,
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
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Text(
                    "Contact me",
                    style:
                        GoogleFonts.dancingScript(fontSize: 27, color: kwhite),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          bool? res =
                              await FlutterPhoneDirectCaller.callNumber(currentuserdata.phoneNumber);
                          print(res);
                        }, //
                        child: ConatinerwithWidget(
                            containerdecoration: BoxDecoration(
                                color: kDominantcolor,
                                borderRadius: BorderRadius.circular(50)),
                            childwidget: const Icon(
                              kcall,
                              color: kDominanttextcolor,
                            ),
                            height: 50,
                            width: 50),
                      ),
                      ConatinerwithWidget(
                          containerdecoration: BoxDecoration(
                              color: kDominantcolor,
                              borderRadius: BorderRadius.circular(50)),
                          childwidget: const Icon(
                            kmail,
                            color: kDominanttextcolor,
                          ),
                          height: 50,
                          width: 50),
                    ],
                  ),
                  h10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        currentuserdata.phoneNumber,
                        style: subtextstyle,
                      ),
                      Text(currentuserdata.email, style: subtextstyle),
                    ],
                  ),
                  h20,
                ],
              ),
            ),
          ),
          const Text('More About me'),
          const Text(
              'Work: Flutter developer\nYears of expirence: 2 \nLive:Countryn\nStaus:Focused\n')
        ],
      ),
    );
  }
}
