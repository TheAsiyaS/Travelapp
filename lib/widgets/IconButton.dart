import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const  IconButtonWidget(
      {super.key, required this.onPressFunc, required this.iconwidget});
  final Function() onPressFunc;
  final Widget iconwidget;
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressFunc, icon: iconwidget);
  }
}
