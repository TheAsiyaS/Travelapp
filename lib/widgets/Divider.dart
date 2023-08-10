import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget(
      {super.key,
      required this.height,
      required this.thickness,
      required this.indent,
      required this.endIndent,
      required this.color});
  final double height;
  final double thickness;
  final double indent;
  final double endIndent;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: color,
    );
  }
}
