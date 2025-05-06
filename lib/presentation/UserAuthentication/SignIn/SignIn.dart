import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/Functions/userauthentication.dart';
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
    final emailController = TextEditingController();

    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: kdominatgrey,
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
                          image: AssetImage('asset/company.jpeg'),
                          fit: BoxFit.cover)),
                ),
              ),
              Positioned(
                bottom: 0,
                left: size.width / 9,
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
                fontSize: 40, fontWeight: FontWeight.bold, color: kwhite),
          ),
          h20,
          Card(
            color: const Color.fromARGB(19, 1, 255, 230),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15),
                  child: CupertinotextfieldWidget(
                    
                      controller: emailController,
                      placeholderText: 'Enter your e-mail adress....',
                      placeholderStyle: const TextStyle(color: klightwhite),
                      boxDecoration: const BoxDecoration(),
                      prefixWidget: h10,
                      suffixWidget: h10,
                      keybodtype: TextInputType.name,
                      obscureText: false,
                      style: const TextStyle(color: kwhite),
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
                      placeholderText: 'Enter your Password....',
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
                      obscureText: true,
                      style: const TextStyle(color: kwhite),
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
                    onPress: () async {
                      final res = await verifyUser(
                          emailController.text, passwordController.text);
                      if (res == true) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const NavigationBarScreen()));
                      } else {}
                    }),
                SizedBox(
                  height: size.height / 9,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const UsernameProfileAdd()));
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
