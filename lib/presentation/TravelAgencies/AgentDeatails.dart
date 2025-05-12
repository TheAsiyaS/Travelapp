import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/presentation/Animation/Textanimaion.dart';
import 'package:travelapp/widgets/IconButton.dart';
import 'dart:math';
import 'dart:ui';

class AgentDetails extends StatelessWidget {
  const AgentDetails(
      {super.key,
      required this.imageurl,
      required this.rating,
      required this.phoneNumber,
      required this.email,
      required this.username});
  final String imageurl;
  final String rating;
  final String phoneNumber;
  final String email;
  final String username;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          username,
          style: TextStyle(color: kwhite),
        ),
        backgroundColor: ktransparent,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: kdominatgrey,
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: size.height / 2,
            width: size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [ktransparent, kdominatgrey])),
            child: Row(
              children: [
                SizedBox(
                  width: size.width / 2,
                  child: FanCardAnimation(
                    url: imageurl,
                  ),
                ),
                SizedBox(width: size.width / 2, child: AnimatedTextList()),
              ],
            ),
          ),
          Text(
            'contact now',
            style: GoogleFonts.lora(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               IconButtonWidget(
                  onPressFunc: () {},
                  iconwidget: const Icon(
                    kcall,
                    color: kDominantcolor,
                  )),
              Text(
                'Phone Number: $phoneNumber',
                style: const TextStyle(fontSize: 18),
              ),
             
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Email: $email ',
                style: const TextStyle(fontSize: 18),
              ),
              IconButtonWidget(
                  onPressFunc: () {},
                  iconwidget: const Icon(
                    kmail,
                    color: kSubDominantcolor,
                  )),
            ],
          ),
          h10,
          const Text(
            'Agent details',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const Text(
            'help customers find a suitable package holiday or plan independent travel. make bookings and payments using online computer systems. advise customers about passports, insurance, visas, vaccinations, tours and vehicle hire. inform customers of changes like cancelled flights.',
            style: subtextstyle,
          ),
          const Divider(
            color: kSubDominantcolor,
          ),
          const Row(
            children: [
              Text('Survice:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Expanded(
                  child: Text(
                'A travel agent is a highly organized professional who is passionate about travel and helping others. They are focused on creating the best possible experiences, directly catered to their clients. They work with hotels, airlines, and',
                style: subtextstyle,
              )),
            ],
          )
        ],
      ),
    );
  }
}

class FanCardAnimation extends StatefulWidget {
  final String url;
  FanCardAnimation({
    super.key,
    required this.url,
  });

  @override
  _FanCardAnimationState createState() => _FanCardAnimationState();
}

class _FanCardAnimationState extends State<FanCardAnimation>
    with TickerProviderStateMixin {
  late AnimationController entryController;
  late AnimationController staggerController;

  late Animation<double> entryAnimation;
  late Animation<double> blueOffsetAnim;
  late Animation<double> greenOffsetAnim;
  late Animation<double> redOffsetAnim;
  @override
  void initState() {
    super.initState();

    // First controller: All cards enter from left
    entryController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    entryAnimation = CurvedAnimation(
      parent: entryController,
      curve: Curves.easeOutBack,
    );

    // Second controller: stagger movement to reveal the cards
    staggerController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    blueOffsetAnim = Tween<double>(begin: 0, end: 30).animate(
      CurvedAnimation(
        parent: staggerController,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );

    greenOffsetAnim = Tween<double>(begin: 0, end: 30).animate(
      CurvedAnimation(
        parent: staggerController,
        curve: const Interval(0.4, 0.8, curve: Curves.easeOut),
      ),
    );
    redOffsetAnim = Tween<double>(begin: 0, end: 30).animate(
      CurvedAnimation(
        parent: staggerController,
        curve: const Interval(0.8, 1.0, curve: Curves.easeOut),
      ),
    );

    // Start animation sequence
    Future.delayed(const Duration(milliseconds: 300), () async {
      await entryController.forward();
      await staggerController.forward();
    });
  }

  Widget buildCard(
      {required Color color,
      required double angle,
      required double finalDx,
      required double verticalOffset,
      required Animation<double> revealOffset,
      required double scale,
      required String imageurl}) {
    return AnimatedBuilder(
      animation: Listenable.merge([entryAnimation, staggerController]),
      builder: (context, child) {
        final dx = lerpDouble(
            -200, finalDx + revealOffset.value, entryAnimation.value)!;
        final rotate = lerpDouble(0, angle, entryAnimation.value)!;
        final sc = lerpDouble(0.9, scale, entryAnimation.value)!;

        return Transform.translate(
          offset: Offset(dx, verticalOffset),
          child: Transform.rotate(
            angle: rotate,
            child: Transform.scale(
              scale: sc,
              child: child,
            ),
          ),
        );
      },
      child: Card(
        elevation: 6,
        child: Container(
          width: 140,
          height: 180,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageurl), fit: BoxFit.cover)),
          child: Container(
            color: color,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ktransparent,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Red (bottom card)
            buildCard(
                color: const Color.fromARGB(173, 26, 31, 31),
                angle: -pi / 30,
                finalDx: -10,
                verticalOffset: 0,
                revealOffset: redOffsetAnim,
                scale: .92,
                imageurl: widget.url),

            // Green (middle)
            buildCard(
                color: const Color.fromARGB(126, 30, 63, 62),
                angle: 0,
                finalDx: 0,
                verticalOffset: -10,
                revealOffset: greenOffsetAnim,
                scale: 0.95,
                imageurl: widget.url),

            // Blue (top card)
            buildCard(
                color: ktransparent,
                angle: pi / 20,
                finalDx: 10,
                verticalOffset: -20,
                revealOffset: blueOffsetAnim,
                scale: 1.0,
                imageurl: widget.url),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    entryController.dispose();
    staggerController.dispose();
    super.dispose();
  }
}
