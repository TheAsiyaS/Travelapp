import 'package:flutter/material.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/colours.dart';
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
        // SizedBox(
        //   height: size.height / 3,
        //   width: size.width,
        //   child: GridView.count(
        //     crossAxisCount: 1,
        //     crossAxisSpacing: 10,
        //     mainAxisSpacing: 10,
        //     childAspectRatio: 3 / 4,
        //     scrollDirection: Axis.horizontal,
        //     children: List.generate(
        //         10,
        //         (index) => Container(
        //               decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(10),
        //                   image: const DecorationImage(
        //                       image: NetworkImage(
        //                           'https://static.toiimg.com/thumb/msid-93339099,width-748,height-499,resizemode=4,imgsize-177934/.jpg'),
        //                       fit: BoxFit.cover)),
        //               child: Container(
        //                 decoration: const BoxDecoration(
        //                     gradient: LinearGradient(
        //                         begin: Alignment.topCenter,
        //                         end: Alignment.bottomCenter,
        //                         colors: [ktransparent, kblackdarktrans])),
        //               ),
        //             )),
        //   ),
        // ),
        // Row(
        //   children: [
        //     const Text(
        //       'Some Cheaptest',
        //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        //     ),
        //     const Spacer(),
        //     TextbuttonWidget(
        //         onPressFunc: () {},
        //         childwidget: const Text(
        //           'See all',
        //           style: TextStyle(color: kDominanttextcolor),
        //         ))
        //   ],
        // ),
        // SizedBox(
        //   height: size.height / 5,
        //   width: size.width,
        //   child: GridView.count(
        //     crossAxisCount: 1,
        //     crossAxisSpacing: 10,
        //     mainAxisSpacing: 10,
        //     childAspectRatio: 3 / 4,
        //     scrollDirection: Axis.horizontal,
        //     children: List.generate(
        //         10,
        //         (index) => Container(
        //               decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(10),
        //                   image: const DecorationImage(
        //                       image: NetworkImage(
        //                           'https://i.pinimg.com/originals/f4/4c/94/f44c945f6a4bbd70a615bfb393efe7a7.jpg'),
        //                       fit: BoxFit.cover)),
        //               child: Container(
        //                 decoration: const BoxDecoration(
        //                     gradient: LinearGradient(
        //                         begin: Alignment.topCenter,
        //                         end: Alignment.bottomCenter,
        //                         colors: [ktransparent, kblackdarktrans])),
        //               ),
        //             )),
        //   ),
        // )
      ],
    ));
  }
}
