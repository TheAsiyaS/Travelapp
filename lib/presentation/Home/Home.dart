import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/main.dart';
import 'package:travelapp/presentation/Home/SubScreens/Advanture.dart';
import 'package:travelapp/presentation/Home/SubScreens/Beach.dart';
import 'package:travelapp/presentation/Home/SubScreens/Historical.dart';
import 'package:travelapp/presentation/Home/SubScreens/cheep.dart';
import 'package:travelapp/presentation/Home/SubScreens/Mostpeoplevisit.dart';
import 'package:travelapp/presentation/Home/SubScreens/Popular.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';
import 'package:travelapp/widgets/IconButton.dart';
import 'package:travelapp/widgets/onssearchtimescreen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final ValueNotifier<double> xOffsetNotifier = ValueNotifier<double>(0);
    final ValueNotifier<double> yOffsetNotifier = ValueNotifier<double>(0);
    final ValueNotifier<bool> isDrawerOpenNotifier = ValueNotifier<bool>(false);

    void toggleDrawer() {
      if (isDrawerOpenNotifier.value) {
        xOffsetNotifier.value = 0;
        yOffsetNotifier.value = 0;
        isDrawerOpenNotifier.value = false;
      } else {
        xOffsetNotifier.value = 290;
        yOffsetNotifier.value = 100;
        isDrawerOpenNotifier.value = true;
      }
    }

    return ValueListenableBuilder(
        valueListenable: isDrawerOpenNotifier,
        builder: (context, isDrawerOpen, child) {
          return AnimatedContainer(
            transform: Matrix4.translationValues(
              xOffsetNotifier.value,
              yOffsetNotifier.value,
              0,
            )
              ..scale(isDrawerOpen ? 0.65 : 1.00)
              ..rotateZ(isDrawerOpen ? -50 : 0),
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 49, 77, 95),
              borderRadius: isDrawerOpen
                  ? BorderRadius.circular(40)
                  : BorderRadius.circular(0),
            ),
            child: Scaffold(
              extendBodyBehindAppBar: true,    
              appBar: AppBar(
                backgroundColor: ktransparent,    
                leading: GestureDetector(
                  onTap: toggleDrawer,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(162, 130, 130, 130),
                        borderRadius: BorderRadius.circular(40)),
                    child: Icon(
                      isDrawerOpen ? Icons.arrow_back_ios : Icons.menu,
                      color: kwhite,
                    ),
                  ),
                ),
                actions: [
                  CircleAvatar(
                    backgroundColor: kDominantcolor,
                    backgroundImage:
                        NetworkImage(currentuserdata.value.photoUrl),
                    radius: 25,
                  ), 
                  w20
                ],
              ),
              body: DefaultTabController(
                length: 6,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: size.height / 2,
                        width: size.width,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('asset/homrpage.jpeg'),
                                fit: BoxFit.cover,
                                opacity: 80)),
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [ktransparent, kblackTransparent])),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('GOOD MORNING',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        color: kwhite)),
                                const Text(
                                  'Explore the world with Longitude',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                      color: kwhite),
                                ),
                                h20,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ConatinerwithWidget(
                                      height: 50,
                                      width: 50,
                                      containerdecoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              100, 255, 255, 255),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      childwidget: IconButtonWidget(
                                          onPressFunc: () {},
                                          iconwidget: const Icon(
                                            kiconsearch,
                                            color: kwhite,
                                          )),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const OnsearchtimeScreen()));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                100, 255, 255, 255),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        height: 50,
                                        width: size.width / 1.3,
                                        child: const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '  Search your hapiness......',
                                                style: TextStyle(
                                                    color: kwhite,
                                                    fontSize: 18),
                                              )
                                            ]),
                                      ),
                                    ),
                                  ],
                                ),
                                h20
                              ],
                            ),
                          ),
                        ),
                      ),
                      h20,
                      TabBar(
                        isScrollable: true,
                        labelColor: kDominanttextcolor,
                        unselectedLabelColor: kSubDominantcolor,
                        labelStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                        indicatorColor: const Color.fromARGB(133, 43, 74, 88),
                      tabAlignment: TabAlignment.start,
               // labelPadding: EdgeInsets.symmetric(horizontal: 15),  
                        tabs: [
                          Tab(
                            child: Text('Popular',
                                style: GoogleFonts.playfairDisplay()),
                          ),
                          Tab(
                            child: Text('Cheap',
                                style: GoogleFonts.playfairDisplay()),
                          ),
                          Tab(
                            child: Text('Most people visit',
                                style: GoogleFonts.playfairDisplay()),
                          ),
                          Tab(
                            child: Text('Advanture',
                                style: GoogleFonts.playfairDisplay()),
                          ),
                          Tab(
                            child: Text('historical',
                                style: GoogleFonts.playfairDisplay()),
                          ),
                          Tab(
                            child: Text('Beach',
                                style: GoogleFonts.playfairDisplay()),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height / 1.5,
                        width: size.width,
                        child: const TabBarView(children: [
                          Popular(),
                          Cheep(),
                          Mostpeoplevisit(),
                          Adavanture(),
                          Historical(),
                          Beach()
                        ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
