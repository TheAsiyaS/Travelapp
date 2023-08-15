import 'package:flutter/material.dart';


class ConatinerwithWidget extends StatelessWidget {
  const ConatinerwithWidget({
    super.key,
    required this.containerdecoration,
    required this.childwidget,
  });

  final BoxDecoration containerdecoration;
  final Widget childwidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: containerdecoration,
      child: childwidget
    );
  }
}
