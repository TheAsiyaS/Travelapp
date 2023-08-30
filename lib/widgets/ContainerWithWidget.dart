import 'package:flutter/material.dart';

class ConatinerwithWidget extends StatelessWidget {
  const ConatinerwithWidget({
    super.key,
    required this.containerdecoration,
    required this.childwidget, required this.height, required this.width,
  });

  final BoxDecoration containerdecoration;
  final Widget childwidget;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: containerdecoration,
        child: childwidget);
  }
}
