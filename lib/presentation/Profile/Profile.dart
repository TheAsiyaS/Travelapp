import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
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
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://t4.ftcdn.net/jpg/04/25/65/97/360_F_425659755_5BaLdNbbCtQbbiz1JNFBikshfiCWI5NE.jpg'),
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
          const Text(
            'Username',
            style: textstyle,
          ),
          const Text(
            'Name',
          ),
          SizedBox(
            height: size.height / 10,
            width: size.width / 2,
            child: const Text(
              'About the user.Like their Working exprience , Notable awards they got , Exprience about the LONGITUDE ',
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
                    style: GoogleFonts.dancingScript(fontSize: 27),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: ()async{
                           bool? res = await FlutterPhoneDirectCaller.callNumber('123');
                        },//
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '1234567890',
                        style: subtextstyle,
                      ),
                      Text('abcxyz@gmail.com', style: subtextstyle),
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
