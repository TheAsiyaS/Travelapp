import 'package:flutter/cupertino.dart';

class CupertinotextfieldWidget extends StatelessWidget {
  const CupertinotextfieldWidget(
      {super.key,
      required this.placeholderText,
      required this.placeholderStyle,
      required this.boxDecoration,
      required this.prefixWidget,
      required this.suffixWidget,
      required this.keybodtype,
      required this.obscureText, required this.style});
  final String placeholderText;
  final TextStyle placeholderStyle;
  final BoxDecoration boxDecoration;
  final Widget prefixWidget;
  final Widget suffixWidget;
  final TextInputType keybodtype;
  final bool obscureText;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholder: placeholderText,
      placeholderStyle: placeholderStyle,
      decoration: boxDecoration,
      prefix: prefixWidget,
      suffix: suffixWidget,
      keyboardType: keybodtype,
      obscureText: obscureText,
      style: style,
    );
  }
}
