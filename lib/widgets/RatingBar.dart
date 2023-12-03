import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({super.key, required this.intialvalue, required this.height, required this.width, required this.scrolldirection});
  final int intialvalue;
  final double height;
  final double width;
  final Axis  scrolldirection;
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> rating = ValueNotifier<int>(intialvalue);

    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: ListView.separated(
          scrollDirection:scrolldirection,
          itemBuilder: (context, index) {
            return IconButton(
              onPressed: () {
                rating.value = index + 1;
              },
              icon: ValueListenableBuilder<int>( 
                valueListenable: rating,
                builder: (context, value, child) {
                  return index < value
                      ? const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        )
                      : const Icon(
                          Icons.star_border_outlined,
                          size: 18,
                        );
                },
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 1,
            );
          },
          itemCount: 5,
        ),
      ),
    );
  }
}
