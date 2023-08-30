import 'dart:async';

import 'package:flutter/material.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/BottomWidget.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';
import 'package:travelapp/widgets/IconButton.dart';
import 'package:travelapp/widgets/TextButton.dart';

final images = [
  'https://lp-cms-production.imgix.net/2023-02/GettyImages-1172642617.jpg?auto=format&w=1440&h=810&fit=crop&q=75',
  'https://c4.wallpaperflare.com/wallpaper/543/302/394/lights-the-moon-france-paris-panorama-hd-wallpaper-preview.jpg',
  'https://media.istockphoto.com/id/1426025965/photo/light-trails-from-rush-hour-traffic-light-up-walterdale-bridge-in-edmonton-canada-on-a-sunset.webp?b=1&s=170667a&w=0&k=20&c=LFN9EvwLxlxZMuq_MW1AOmq4BjzTkDR8uDvhsk9b9og=',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Dubai_Skylines_at_night_%28Pexels_3787839%29.jpg/640px-Dubai_Skylines_at_night_%28Pexels_3787839%29.jpg',
  'https://res.cloudinary.com/du5jifpgg/image/upload/t_opengraph_image/Parcours/itin%C3%A9raires/Disneyland-et-alentours/Fetes-de-fin-d-annee-2021-a-disneyland-paris-header.jpg'
];
final premiumqaulity = [
  'Download to Read offline without wi-fi',
  'Guide without ad interrupyions',
  '2x higher Picture quality then our free plan',
  'Play songs in any order, with unlimted skips',
  'Cancel monthly plans online anytime',
  'Something ',
];

class SlideshowScreen extends StatefulWidget {
  const SlideshowScreen({super.key});

  @override
  _SlideshowScreenState createState() => _SlideshowScreenState();
}

class _SlideshowScreenState extends State<SlideshowScreen>
    with TickerProviderStateMixin {
  String fullText =
      ' Hello Username ,\n we will let you know how to set your destination  .';
  String displayedText = '';
  int textIndex = 0;
  late AnimationController _controller;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _startTypingAnimation();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 4) {
        _pageController.nextPage(
            duration: const Duration(seconds: 1), curve: Curves.ease);
      } else {
        _pageController.jumpToPage(0);
      }
    });
  }

  void _startTypingAnimation() {
    _controller.forward().then((_) {
      if (textIndex <= fullText.length) {
        setState(() {
          displayedText = fullText.substring(0, textIndex);
          textIndex++;
        });
        _controller.reset();
        _startTypingAnimation();
      } else {
        textIndex = 0;
        displayedText = '';
        _startTypingAnimation();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                SizedBox(
                  height: size.height / 2,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimatedBuilder(
                          animation: _pageController,
                          builder: (BuildContext context, Widget? child) {
                            double value = 1.0;
                            if (_pageController.position.haveDimensions) {
                              value = _pageController.page! - index;
                              value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
                            }
                            return SizedBox(
                              width: Curves.easeInExpo.transform(value) * 250,
                              child: child,
                            );
                          },
                          child: ConatinerwithWidget(
                              height: size.height / 2,
                              width: size.width,
                              containerdecoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        images[index],
                                      ),
                                      fit: BoxFit.cover)),
                              childwidget: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: size.width / 1.2),
                                    child: IconButtonWidget(
                                        onPressFunc: () {
                                          // Navigator.of(context).push(
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             SlideshowScreens()));
                                        },
                                        iconwidget: const Icon(
                                          kforward,
                                          color: klightwhite,
                                          size: 40,
                                        )),
                                  )
                                ],
                              )));
                    },
                  ),
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? child) {
                    return Text(
                      displayedText,
                      style: const TextStyle(fontSize: 30, color: kwhite),
                    );
                  },
                ),
              ],
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
     * Compare transportation & accommodation options. ...
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
              childwidget: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Get premium',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),

                  Text(
                    'Try one month free that will help you get more easy to handle your travelling Try one month free that will help you get more easy to handle your travelling ',
                    style: TextStyle(
                      color: kgrey,
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
