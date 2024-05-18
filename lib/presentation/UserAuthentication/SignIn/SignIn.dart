import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/presentation/NavigationBar.dart';
import 'package:travelapp/presentation/UserAuthentication/SignUp/Username_profile_add.dart';
import 'package:travelapp/widgets/CupertinoTextfield.dart';
import 'package:travelapp/widgets/IconButton.dart';
import 'package:travelapp/widgets/NavButtonWidget.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final usernameController = TextEditingController();

    final passwordController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipPath(
                clipper: WaveClipperOne(),
                child: Container(
                  height: size.height / 2.2,
                  width: size.width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://media.bizj.us/view/img/12058731/12foleyhoagbrucemartin*xx4800-2700-0-250.jpg'),
                          fit: BoxFit.cover)),
                  child: Container(
                    color: const Color.fromARGB(122, 34, 54, 55),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width / 10),
                child: const CircleAvatar(
                  backgroundColor: kDominantcolor,
                  radius: 70,
                  backgroundImage: AssetImage('asset/logo.png'),
                ),
              ),
            ],
          ),
          Text(
            'Longitude',
            style: GoogleFonts.dancingScript(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          h20,
          Card(
            color: const Color.fromARGB(19, 1, 255, 230),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15),
                  child: CupertinotextfieldWidget(
                    controller: usernameController,
                      placeholderText: 'Username....',
                      placeholderStyle: const TextStyle(color: klightwhite),
                      boxDecoration: const BoxDecoration(),
                      prefixWidget: h10,
                      suffixWidget: h10,
                      keybodtype: TextInputType.name,
                      obscureText: false,
                      style: const TextStyle(),
                      onchanged: (value) {},
                      onsubmitted: (value) {}),
                ),
                const Divider(
                  color: klightwhite,
                  endIndent: 20,
                  indent: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: CupertinotextfieldWidget(
                    controller: passwordController,
                      placeholderText: 'Password....',
                      placeholderStyle: const TextStyle(color: klightwhite),
                      boxDecoration: const BoxDecoration(),
                      prefixWidget: h10,
                      suffixWidget: IconButtonWidget(
                          onPressFunc: () {},
                          iconwidget: const Icon(
                            Icons.visibility_outlined,
                            color: klightwhite,
                          )),
                      keybodtype: TextInputType.name,
                      obscureText: false,
                      style: const TextStyle(),
                      onchanged: (value) {},
                      onsubmitted: (value) {}),
                ),
                const Divider(
                  color: klightwhite,
                  endIndent: 20,
                  indent: 20,
                ),
                h20,
                NavButton(
                    width: 3,
                    size: size,
                    text: 'Login',
                    color: kDominantcolor,
                    onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const NavigationBarScreen()));
                    }),
                SizedBox(
                  height: size.height / 9,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  const UsernameProfileAdd()));
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: kwhite),
                      ))
                ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
