import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> rating = ValueNotifier<int>(0);

    return SizedBox(
      height: 30,
      width: 225,
      child: Center(
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
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
