import 'package:flutter/material.dart';
import 'package:travelapp/presentation/Home/Drawer.dart';
import 'package:travelapp/presentation/Home/Home.dart';

class HomeStack extends StatelessWidget {
  const HomeStack({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Stack(
          children: [
            Drawerscreen(),
            Home(),
          ],
        ),
      );
  }
}