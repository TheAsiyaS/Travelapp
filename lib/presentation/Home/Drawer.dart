import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/main.dart';
import 'package:travelapp/presentation/Home/DrawerScreens/FavouritePlace.dart';
import 'package:travelapp/presentation/Home/DrawerScreens/HotelBook.dart';
import 'package:travelapp/presentation/Home/DrawerScreens/HotelSave.dart';
import 'package:travelapp/presentation/Profile/Profile.dart';

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
    final drwawerSubTitle = ['Hotels', 'Places', 'Hotels', 'Profile'];
    final drawerScreens = [
      const HotelBookedScreen(),
      const FavouritePlaces(),
      const SavedHotels(),
      const Profile()
    ];
    return Scaffold(
      backgroundColor: kbottomSubDominant,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder(
              valueListenable: currentuserdata,
              builder: (context, value, _) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          NetworkImage(currentuserdata.value.photoUrl),
                    ),
                    h10,
                    Text(
                      currentuserdata.value.username,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: kwhite),
                    ),
                    h10,
                  ],
                );
              }),
          SizedBox(
            height: size.height / 2,
            width: size.width,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => drawerScreens[index]));
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
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: kDominantTrans,
                  );
                },
                itemCount: drawerScreens.length),
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
