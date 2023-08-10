import 'package:flutter/material.dart';

class TextbuttonWidget extends StatelessWidget {
  const TextbuttonWidget({super.key, required this.onPressFunc, required this.childwidget});
  final Function() onPressFunc;
  final Widget childwidget;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressFunc, child: childwidget);
  }
}
