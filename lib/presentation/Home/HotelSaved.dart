import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';

class HotelSavedScreen extends StatelessWidget {
  const HotelSavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ktransparent,
        title: const Text('Hotel name'),
        actions: [
          Container(
            height: 20,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: kdominatgrey,
            ),
            child: Center(
              child: Text(
                'Emarald',
                style: GoogleFonts.dancingScript(),
              ),
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ConatinerwithWidget(
              containerdecoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://i.insider.com/619d06dd63e3f3001875560f?width=1000&format=jpeg&auto=webp'),
                      fit: BoxFit.cover)),
              childwidget: h10,
              height: size.height,
              width: size.width),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 5),
            child: SizedBox(
              height: size.height / 4,
              width: size.width,
              child: GridView.count(
                crossAxisCount: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2 / 4.5,
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    10,
                    (index) => Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    height: size.height / 7,
                                    width: size.width / 1.3,
                                    decoration: BoxDecoration(
                                        color: kblackTransparent,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 30),
                                          child: ListTile(
                                            title: Text(
                                              'Hotel name',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            subtitle: Text(
                                                'Something about hotel.Location of the hotel situated'),
                                            trailing: Column(
                                              children: [
                                                Text(
                                                  '*4.5',
                                                  style:
                                                      TextStyle(color: kamber),
                                                ),
                                                Text(
                                                  'Rating',
                                                  style: subtextstyle,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: size.width / 2.5),
                              child: ConatinerwithWidget(
                                  containerdecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              'https://www.travelandleisure.com/thmb/woRV60pIj0MjbWPXPPNH3kQ-bTc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/hilton-living-room-resorts-world-las-vegas-RESORTSWORLDLV0621-85853ade600248ff93533160c4e946df.jpg'))),
                                  childwidget: h10,
                                  height: 100,
                                  width: 200),
                            ),
                          ],
                        )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
