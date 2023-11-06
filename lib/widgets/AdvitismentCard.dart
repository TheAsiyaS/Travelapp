import 'package:flutter/material.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';

class Adcard extends StatelessWidget {
  const Adcard({
    super.key,
    required this.isDarkMode,
    required this.size,
  });

  final bool isDarkMode;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      surfaceTintColor: isDarkMode ? kwhite : kblack,
      shadowColor: isDarkMode ? kwhite : kblack,
      child: SizedBox(
        height: size.height / 7,
        child: Center(
          child: ListTile(
            title: const Text(
              'Arabica',
              style: textstyle,
            ),
            subtitle: const Text('Subtitle , about place'),
            trailing: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://teaaroma.in/wp-content/uploads/2023/05/Arabica-Coffee-3.jpg'),
                      fit: BoxFit.cover)),
            ),
          ),
        ),
      ),
    );
  }
}
