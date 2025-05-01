import 'package:flutter/material.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/presentation/Home/HomeStack.dart';
import 'package:travelapp/presentation/Hotels/Hotels.dart';
import 'package:travelapp/presentation/TourGuide/TourGuide.dart';
import 'package:travelapp/presentation/TravelAgencies/Agencies.dart';

ValueNotifier<int> bottomIndex = ValueNotifier(0); //bottomnavigationBar index
final navigationScreens = [
  const HomeStack(),
  const Hotels(),
  const Agencies(),
  const ScreenGuid()
];

class NavigationBarScreen extends StatelessWidget {
  const NavigationBarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return ValueListenableBuilder(
      
        valueListenable: bottomIndex,
        builder: (BuildContext ctx, int newindex, Widget? _) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: isDarkMode ? kblack : kwhite,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: kDominanttextcolor,
                unselectedItemColor: kSubDominantcolor,
                elevation: 0,
                currentIndex: bottomIndex.value,
                onTap: (index) {
                  bottomIndex.value = index;
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                      ),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.hotel_class_outlined,
                      ),
                      label: 'Hotels'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.tour,
                      ),
                      label: 'Agencies'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.menu_book_outlined,
                      ),
                      label: 'Guide'),
                ]),
            body: navigationScreens[bottomIndex.value],
          );
        });
  }
}
