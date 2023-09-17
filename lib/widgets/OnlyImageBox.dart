import 'package:flutter/material.dart';

class OnlyimageBoxWidget extends StatelessWidget {
  const OnlyimageBoxWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.boxdecoration,
      required this.childwidget});

  final double height;
  final double width;

  final Decoration boxdecoration;

  final Widget childwidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: boxdecoration,
      child: childwidget,
    );
  }
}
