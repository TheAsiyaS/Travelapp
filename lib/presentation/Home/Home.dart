import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/presentation/Home/SubScreens/Advanture.dart';
import 'package:travelapp/presentation/Home/SubScreens/Beach.dart';
import 'package:travelapp/presentation/Home/SubScreens/Calm.dart';
import 'package:travelapp/presentation/Home/SubScreens/Cheep.dart';
import 'package:travelapp/presentation/Home/SubScreens/Mostpeoplevisit.dart';
import 'package:travelapp/presentation/Home/SubScreens/Popular.dart';
import 'package:travelapp/presentation/Profile/Profile.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';
import 'package:travelapp/widgets/IconButton.dart';
import 'package:travelapp/widgets/onssearchtimescreen.dart';

final List homeimageurls = [
  'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/92/80/ef/caption.jpg?w=300&h=300&s=1',
  'https://images.unsplash.com/photo-1564507592333-c60657eea523?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dGFqfGVufDB8fDB8fHww&w=1000&q=80',
  'https://discovery.sndimg.com/content/dam/images/discovery/fullset/2022/8/15/GettyImages-465883815.jpg.rend.hgtvcom.476.666.suffix/1660583591509.jpeg'
];

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ktransparent,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Profile()));
            },
            child: const CircleAvatar(
              backgroundImage: NetworkImage(userprofileImage),
              radius: 25,
            ),
          ),
          w20
        ],
      ),
      extendBodyBehindAppBar: true,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //
              const Text('hello, username'),
              GridView.count(
                crossAxisCount: 2,
                children: List.generate(10, (index) => Container()),
              ),
              Container(
                color: kbottomSubDominant,
                height: size.height / 3,
                width: size.width,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://www.guinnessworldrecords.com/Images/Burj-portrait-lagre_tcm25-475749.jpg'),
                    ),
                    h10,
                    Text(
                      'Username',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    h10,
                  ],
                ),
              ),
              SizedBox(
                height: size.height / 2,
                width: size.width,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return const ListTile(
                        title: Text('Save'),
                        subtitle: Text('Hotels save '),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: 4),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Longitude',
                  style: GoogleFonts.dancingScript(fontSize: 20),
                ),
                Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('asset/logo.png'),
                          fit: BoxFit.cover)),
                ),
              ]),
            ],
          ),
        ),
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
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1630618357937-bb2aa9c8c911?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE0fHx8ZW58MHx8fHx8&w=1000&q=80'),
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
                                fontWeight: FontWeight.bold, fontSize: 30)),
                        const Text(
                          'Explore the world with Longitude',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 35),
                        ),
                        h20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ConatinerwithWidget(
                              height: 50,
                              width: 50,
                              containerdecoration: BoxDecoration(
                                  color: kwhite,
                                  borderRadius: BorderRadius.circular(15)),
                              childwidget: IconButtonWidget(
                                  onPressFunc: () {},
                                  iconwidget: const Icon(
                                    kiconsearch,
                                    color: kdominatgrey,
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const OnsearchtimeScreen()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: kwhite,
                                    borderRadius: BorderRadius.circular(15)),
                                height: 50,
                                width: size.width / 1.3,
                                child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '  Search your hapiness......',
                                        style: TextStyle(
                                            color: kdominatgrey, fontSize: 18),
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
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                indicatorColor: kgreyTransparent,
                tabs: [
                  Tab(
                    child:
                        Text('Popular', style: GoogleFonts.playfairDisplay()),
                  ),
                  Tab(
                    child: Text('Cheep', style: GoogleFonts.playfairDisplay()),
                  ),
                  Tab(
                    child: Text('Most people visit',
                        style: GoogleFonts.playfairDisplay()),
                  ),
                  Tab(
                    child:
                        Text('Advanture', style: GoogleFonts.playfairDisplay()),
                  ),
                  Tab(
                    child: Text('Calm', style: GoogleFonts.playfairDisplay()),
                  ),
                  Tab(
                    child: Text('Beach', style: GoogleFonts.playfairDisplay()),
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
                  Calm(),
                  Beach()
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
