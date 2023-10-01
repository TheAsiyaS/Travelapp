import 'package:flutter/material.dart';

class SnackbarWidget extends StatelessWidget {
  const SnackbarWidget({
    Key? key, required this.icon, required this.message,
  }) : super(key: key);
  final IconData icon;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Expanded(child: Text(message)),
       
        IconButton(onPressed: () {}, icon: Icon(icon))
      ],
    );
  }
}