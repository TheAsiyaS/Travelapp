import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/Domain/DB/Infrastructure/Auhentication/UserAuthentication.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/main.dart';
import 'package:travelapp/presentation/Home/DrawerScreens/FavouritePlace.dart';
import 'package:travelapp/presentation/Home/DrawerScreens/HotelSave.dart';
import 'package:travelapp/presentation/Home/DrawerScreens/HotelBooked.dart';
import 'package:travelapp/presentation/Profile/Profile.dart';
import 'package:travelapp/presentation/UserAuthentication/SignIn/SignIn.dart';

class Drawerscreen extends StatelessWidget {
  const Drawerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final drwawerTitle = [
      'Booked Hotels',
      'Favourite Places',
      'Saved Hotels',
      'Profile'
    ];
    final drwawerSubTitle = [
      'Hotels',
      'Places',
      'Hotels',
      'Profile',
    ];
    final drawerScreens = [
      const HotelBookedScreen(),
      const FavouritePlaces(),
      const SavedHotels(),
      const Profile()
    ];
    return Scaffold(
      backgroundColor: kbottomSubDominant,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ValueListenableBuilder(
              valueListenable: currentuserdata,
              builder: (context, value, _) {
                return Container(
                  decoration: BoxDecoration(
                      color: kDominantcolor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          bottomLeft: Radius.circular(100))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            NetworkImage(currentuserdata.value.photoUrl),
                      ),
                      Column(
                        children: [
                          Text(
                            currentuserdata.value.username,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: kwhite),
                          ),
                          Text(currentuserdata.value.name)
                        ],
                      ),
                    ],
                  ),
                );
              }),
          SizedBox(
            height: size.height / 10,
          ),
          SizedBox(
            height: size.height / 2.6,
            width: size.width,
            child: Column(
              children: List.generate(drawerScreens.length * 2 - 1, (i) {
                if (i.isEven) {
                  final index = i ~/ 2;
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => drawerScreens[index]),
                      );
                    },
                    title: Text(
                      drwawerTitle[index],
                      style: const TextStyle(color: kwhite),
                    ),
                    subtitle: Text(
                      drwawerSubTitle[index],
                      style: const TextStyle(color: klightwhite),
                    ),
                  );
                } else {
                  return const Divider(color: kDominantTrans);
                }
              }),
            ),
          ),
          Container(
            color: kDominantcolor,
            child: ListTile(
              onTap: () async {
                final result = await signOutUser();
                if (result == true) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => SignIn()),
                      (route) => false);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: kDominantcolor,
                      content: const Text(
                        'Sign out failed. Please try again.',
                        style: TextStyle(color: kwhite),
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
              },
              title: Text(
                'Sign out',
                style:
                    const TextStyle(color: kwhite, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('remove account'),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Longitude',
              style: GoogleFonts.dancingScript(fontSize: 20, color: kwhite),
            ),
            Container(
              height: 70,
              width: 70,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('asset/logo.png'), fit: BoxFit.cover)),
            ),
          ]),
        ],
      ),
    );
  }
}
//infp
