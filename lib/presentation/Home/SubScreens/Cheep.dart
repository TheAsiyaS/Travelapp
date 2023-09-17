import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';
import 'package:travelapp/widgets/IconButton.dart';
import 'package:travelapp/widgets/TextButton.dart';

class Cheep extends StatelessWidget {
  const Cheep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: size.height / 3,
          width: size.width,
          child: GridView.count(
            crossAxisCount: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 4,
            scrollDirection: Axis.horizontal,
            children: List.generate(
                10,
                (index) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  'https://www.thoughtco.com/thmb/mmpjK8CDFzUJGNJ3-OaqLUwutjU=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-480604953-589aac555f9b5874ee32b9b1.jpg'),
                              fit: BoxFit.cover)),
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [ktransparent, kblackdarktrans])),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: ConatinerwithWidget(
                                  height: 50,
                                  width: 50,
                                  containerdecoration: BoxDecoration(
                                      color: kwhite,
                                      borderRadius: BorderRadius.circular(15)),
                                  childwidget: IconButtonWidget(
                                      onPressFunc: () {},
                                      iconwidget: const Icon(
                                        kfavoriteOutline,
                                        color: kdominatgrey,
                                      )),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('asset/logo.png'),
                                          fit: BoxFit.cover)),
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      'Nepal',
                                      style: TextStyle(
                                          color: kwhite,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    RatingBar.builder(
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 1),
                                      itemBuilder: (context, _) =>
                                          Transform.scale(
                                        scale:
                                            .5, // Adjust this value to reduce the size
                                        child: const Icon(
                                          Icons.star,
                                          color: kamber,
                                        ),
                                      ),
                                      onRatingUpdate: (double value) {},
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
          ),
        ),
        Row(
          children: [
            const Text(
              'Some Cheaptest',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Spacer(),
            TextbuttonWidget(
                onPressFunc: () {},
                childwidget: const Text(
                  'See all',
                  style: TextStyle(color: kDominanttextcolor),
                ))
          ],
        ),
        SizedBox(
          height: size.height / 5,
          width: size.width,
          child: GridView.count(
            crossAxisCount: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 4,
            scrollDirection: Axis.horizontal,
            children: List.generate(
                10,
                (index) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  'https://i.pinimg.com/originals/f4/4c/94/f44c945f6a4bbd70a615bfb393efe7a7.jpg'),
                              fit: BoxFit.cover)),
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [ktransparent, kblackdarktrans])),
                      ),
                    )),
          ),
        )
      ],
    ));
  }
}
