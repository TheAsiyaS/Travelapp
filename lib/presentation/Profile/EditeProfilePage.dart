import 'package:flutter/material.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/main.dart';
import 'package:travelapp/widgets/CupertinoTextfield.dart';
import 'package:travelapp/widgets/ElevatedbuttonWidget.dart';

class EiteProfile extends StatelessWidget {
  const EiteProfile({super.key});

  @override
  Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size;

    final TextEditingController usernameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edite profile '),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(currentuserdata.photoUrl),
            ),
          ),
          const Text('Username'),
          CupertinotextfieldWidget(
              placeholderText: currentuserdata.username,
              placeholderStyle: subtextstyle,
              boxDecoration: const BoxDecoration(),
              prefixWidget: w2,
              suffixWidget: w2,
              keybodtype: TextInputType.name,
              obscureText: false,
              style: const TextStyle(),
              onchanged: (value) {},
              onsubmitted: (value) {},
              controller: usernameController),
          const Divider(
            color: klightwhite,
          ),
          const Text('name'),
          CupertinotextfieldWidget(
              placeholderText:
                  currentuserdata.name.isEmpty ? "Name" : currentuserdata.name,
              placeholderStyle: subtextstyle,
              boxDecoration: const BoxDecoration(),
              prefixWidget: w2,
              suffixWidget: w2,
              keybodtype: TextInputType.name,
              obscureText: false,
              style: const TextStyle(),
              onchanged: (value) {},
              onsubmitted: (value) {},
              controller: usernameController),
          const Divider(
            color: klightwhite,
          ),
          const Text('Email'),
          CupertinotextfieldWidget(
              placeholderText: currentuserdata.email,
              placeholderStyle: subtextstyle,
              boxDecoration: const BoxDecoration(),
              prefixWidget: w2,
              suffixWidget: w2,
              keybodtype: TextInputType.name,
              obscureText: false,
              style: const TextStyle(),
              onchanged: (value) {},
              onsubmitted: (value) {},
              controller: usernameController),
          const Divider(
            color: klightwhite,
          ),
          const Text('Phone Number'),
          CupertinotextfieldWidget(
              placeholderText: currentuserdata.phoneNumber.isEmpty
                  ? "No number"
                  : currentuserdata.phoneNumber,
              placeholderStyle: subtextstyle,
              boxDecoration: const BoxDecoration(),
              prefixWidget: w2,
              suffixWidget: w2,
              keybodtype: TextInputType.name,
              obscureText: false,
              style: const TextStyle(),
              onchanged: (value) {},
              onsubmitted: (value) {},
              controller: usernameController),
          const Divider(
            color: klightwhite,
          ),
           Center(
                      child: SizedBox(
                        height: size.height / 12,
                        width: size.width / 1.5,
                        child: ElevatedButtonWidget(
                            onPress: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const EiteProfile()));
                            },
                            buttonwidget: const Text(
                              'Edite account',
                              style:TextStyle(
                                  fontSize: 20, color: kwhite),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kDominantcolor,
                            )),
                      ),
                    ),
        ],
      )),
    );
  }
}
