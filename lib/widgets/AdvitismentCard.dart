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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
               Container(
                height: 70,
                width: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://e8w3u9a9.rocketcdn.me/wp-content/uploads/2022/01/product_coffee-bean.jpg'),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: size.height / 8,
                width: size.width / 2,
                child: const ListTile(
                  title: Text(
                    'Arabica',
                    style: textstyle,
                  ),
                  subtitle: Text('No.1 online coffee shop'),
                ),
              ),
           
             
            ],
          ),
        ),
      ),
    );
  }
}
