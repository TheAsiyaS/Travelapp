import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({super.key, required this.onPress, required this.buttonwidget, required this.style});
  final Function() onPress;
  final Widget buttonwidget;
  final ButtonStyle style;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPress,style: style, child: buttonwidget,);
  }
}
