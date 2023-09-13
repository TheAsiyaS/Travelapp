import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';

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
            height: size.height/10,
            width: size.width/2, 
            child: const Text(
              'About the user.Like their Working exprience , Notable awards they got , Exprience about the LONGITUDE ',
              style: subtextstyle,
            ),
          ),
          const Divider(
            color: kSubDominantcolor,
          ),
         
        ],
      ),
    );
  }
}
