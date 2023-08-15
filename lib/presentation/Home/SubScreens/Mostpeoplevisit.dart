import 'package:flutter/material.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';
import 'package:travelapp/widgets/IconButton.dart';

class Mostpeoplevisit extends StatelessWidget {
  const Mostpeoplevisit({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height / 2.5,
            width: size.width,
            child: GridView.count(
              crossAxisCount: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 2.5,
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
                                    containerdecoration: BoxDecoration(
                                        color: kwhite,
                                        borderRadius:
                                            BorderRadius.circular(15)),
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
                                  const Column(
                                    children: [
                                      Text(
                                        'Nepal',
                                        style: TextStyle(
                                            color: kwhite,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
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
          h20,
          const Text(
            'Top 10 places',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          h20,
          SizedBox(
            height: size.height / 7,
            width: size.width,
            child: GridView.count(
              crossAxisCount: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 3,
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
                                padding:  EdgeInsets.only(left:size.width/5),
                                child: IconButtonWidget(
                                    onPressFunc: () {},
                                    iconwidget: const Icon(
                                      kfavoriteOutline,
                                      size: 20,
                                    )),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('asset/logo.png'),
                                        fit: BoxFit.cover)),
                              ),
                            ],
                          ),
                        ),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
