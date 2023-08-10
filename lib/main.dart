import 'package:flutter/material.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/presentation/NavigationBar.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        
          primaryColor: kSubDominantcolor,
          scaffoldBackgroundColor: kblack,
          brightness: Brightness.dark),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const NavigationBarScreen();
      }));
    });
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: kDominantcolor,
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 250,
                width: 250,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'asset/logo2.png',
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
