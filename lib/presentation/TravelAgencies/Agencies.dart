import 'package:flutter/material.dart';
import 'package:travelapp/common/colours.dart';

class Agencies extends StatelessWidget {
  const Agencies({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Agents'),
        backgroundColor: ktransparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          SizedBox(
              height: size.height / 1.09,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1 / 1,
                children: List.generate(
                    10,
                    (index) => Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: size.height / 8,
                                width: size.width,
                                decoration: BoxDecoration(
                                    color: kDominantTrans,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Agent name",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        '+1234567890',
                                      ),
                                      Text('abcxyz@gmail.com',
                                          style:
                                              TextStyle(color: kdominatgrey)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
              ))
        ],
      ),
    );
  }
}
