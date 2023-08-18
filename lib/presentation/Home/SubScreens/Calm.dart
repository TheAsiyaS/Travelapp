import 'package:flutter/material.dart';
import 'package:travelapp/common/colours.dart';

class Calm extends StatelessWidget {
  const Calm({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Expanded(
          // height: size.height/1.5,
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                  height: 100,
                  width: 100,
                  color: kdominatgrey,
                  child: Text('data'));
            },
          ),
        )
      ],
    );
  }
}
