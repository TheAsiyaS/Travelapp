import 'dart:async';
import 'package:flutter/material.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/BottomWidget.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';
import 'package:travelapp/widgets/TextButton.dart';

final images = [
  'asset/guide1.jpeg',
  'asset/guide2.jpeg',
  'asset/guide3.jpeg',
  'asset/guide4.jpeg',
  'asset/guide5.jpeg',
  'asset/guide6.jpeg',
];
final premiumqaulity = [
  'Download to Read offline without wi-fi',
  'Guide without ad interruptions',
  '2x higher Picture quality then our free plan',
  'Play songs in any order, with unlimted skips',
  'Cancel monthly plans online anytime',
  'Something ',
];

class ScreenGuid extends StatefulWidget {
  const ScreenGuid({super.key});

  @override
  _ScreenGuidState createState() => _ScreenGuidState();
}

class _ScreenGuidState extends State<ScreenGuid> with TickerProviderStateMixin {
  int currentIndex = 0;
  late AnimationController _controller;
  late Animation<double> _scaleAnim;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    _scaleAnim = Tween<double>(
      begin: 0.85,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    _timer = Timer.periodic(Duration(seconds: 4), (_) {
      _controller.forward(from: 0.0);
      setState(() {
        currentIndex = (currentIndex + 1) % images.length;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  List<String> getUpcomingImages() {
    List<String> upcoming = [];
    for (int i = 1; i <= 3; i++) {
      int index = (currentIndex + i) % images.length;
      upcoming.add(images[index]);
    }
    return upcoming;
  }

  @override
  Widget build(BuildContext context) {
    final upcoming = getUpcomingImages();

    final size = MediaQuery.of(context).size;
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
            
              children: [
                ClipOval(
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 600),
                    child: Image.asset(
                      images[currentIndex],
                      key: ValueKey(images[currentIndex]),
                      width: size.width / 2,
                      height: size.width / 2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // 🌙 Crescent facing LEFT
                ClipPath(
                  clipper: CrescentClipper(),
                  child: Container(
                    // Crescent size
                    width: size.width / 2,
                    height: size.width / 2,

                    color: kdominatgrey, // or crescent color
                  ),
                ),
              ],
            ),
            h30,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(upcoming.length, (i) {
                // Radius-like sizes: 60 → 40 → 20
                double size = [60.0, 40.0, 20.0][i];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipOval(
                    child: Image.asset(
                      upcoming[i],
                      width: size,
                      height: size,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25, bottom: 20),
              child: Text(
                '10 Useful International Travel Tips for First-Time Travelers',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            const Text(
              '''
     * Prepare your travel documents. ...
     * Research your destination. ...
     * Address money matters. ...
     * Compare transportation & accomodation options. ...
     * Book everything in advance. ...
     * Avoid travel fatigue. ...
     * Prioritize your health & safety. ...
     * Pack appropriately.''',
              style: TextStyle(color: kgrey),
            ),
            TextbuttonWidget(
                onPressFunc: () {},
                childwidget: const Text('More..',
                    style: TextStyle(color: kSubDominantcolor))),
            ConatinerwithWidget(
                height: size.height / 2,
                width: size.width,
                containerdecoration: BoxDecoration(
                    color: kDominantTrans,
                    borderRadius: BorderRadius.circular(20)),
                childwidget: ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              premiumqaulity[index],
                            ),
                            const Spacer(),
                            const Icon(
                              kcheck,
                              color: kSubDominantcolor,
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return h30;
                    },
                    itemCount: premiumqaulity.length)),
            h20,
            ConatinerwithWidget(
              containerdecoration: BoxDecoration(
                  color: kDominantTrans,
                  borderRadius: BorderRadius.circular(20)),
              height: size.height / 6,
              width: size.width,
              childwidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Get premium',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),

                  Text(
                    'Try one month free that will help you get more easy to handle your travelling Try one month free that will help you get more easy to handle your travelling ',
                    style: TextStyle(
                      color: isDarkMode ? kgrey : klightwhite,
                    ),
                  ), //
                ],
              ),
            ),
            h30,
            BottomWidgettop(size: size),
            BottomprivacyPolicy(size: size),
          ],
        ), //
      ),
    );
  }
}

class CrescentClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path outer = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2,
      ));

    // Shift inner circle to the LEFT for left-facing crescent
    Path inner = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(size.width / 2 - size.width * 0.15, size.height / 2),
        radius: size.width / 2,
      ));

    return Path.combine(PathOperation.difference, outer, inner);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
