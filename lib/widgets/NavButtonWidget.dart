import 'package:flutter/material.dart';
import 'package:travelapp/widgets/ElevatedbuttonWidget.dart';

class NavButton extends StatelessWidget {
  const NavButton({
    super.key,
    required this.size, required this.text, required this.color,
  });

  final Size size;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: size.width / 3,
      child: ElevatedButtonWidget(
          onPress: () {},
          buttonwidget: Text(
            text,
            style: const TextStyle(fontSize: 18),
          ),
          style: ElevatedButton.styleFrom(backgroundColor: color)),
    );
  }
}
