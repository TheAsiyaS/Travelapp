import 'package:flutter/material.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/ElevatedbuttonWidget.dart';

class NavButton extends StatelessWidget {
  const NavButton({
    super.key,
    required this.size,
    required this.text,
    required this.color,
    required this.onPress,
    required this.width,
  });

  final Size size;
  final String text;
  final Color color;
  final Function() onPress;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: size.width / width,
      child: ElevatedButtonWidget(
          onPress: onPress,
          buttonwidget: Text(
            text,
            style: const TextStyle(fontSize: 18, color: kwhite),
          ),
          style: ElevatedButton.styleFrom(backgroundColor: color)),
    );
  }
}
