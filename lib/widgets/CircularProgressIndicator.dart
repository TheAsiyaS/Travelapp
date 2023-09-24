import 'package:flutter/material.dart';

class WidgetCircularProgressIndicator extends StatelessWidget {
  const WidgetCircularProgressIndicator(
      {super.key, required this.indicatorColor});
  final Color indicatorColor;
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: indicatorColor,
      strokeWidth: 2,
    );
  }
}
