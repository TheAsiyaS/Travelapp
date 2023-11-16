import 'package:flutter/material.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';
import 'package:travelapp/widgets/IconButton.dart';
import 'package:travelapp/widgets/RatingBar.dart';

class AgentDetails extends StatelessWidget {
  const AgentDetails(
      {super.key,
      required this.imageurl,
      required this.rating,
      required this.phoneNumber,
      required this.email,
      required this.username});
  final String imageurl;
  final String rating;
  final String phoneNumber;
  final String email;
  final String username;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(username),
        backgroundColor: ktransparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ConatinerwithWidget(
              containerdecoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imageurl), fit: BoxFit.cover)),
              childwidget: h10,
              height: size.height / 2,
              width: size.width),
          RatingBar(
              intialvalue: 4,
              height: size.height / 15,
              width: size.width / 1.5,
              scrolldirection: Axis.horizontal),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Phone Number: $phoneNumber',
                style: const TextStyle(fontSize: 18),
              ),
              IconButtonWidget(
                  onPressFunc: () {},
                  iconwidget: const Icon(
                    kcall,
                    color: kSubDominantcolor,
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Email: $email ',
                style: const TextStyle(fontSize: 18),
              ),
              IconButtonWidget(
                  onPressFunc: () {},
                  iconwidget: const Icon(
                    kmail,
                    color: kSubDominantcolor,
                  )),
            ],
          ),
          h10,
          const Text(
            'Agent details',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const Text(
            'help customers find a suitable package holiday or plan independent travel. make bookings and payments using online computer systems. advise customers about passports, insurance, visas, vaccinations, tours and vehicle hire. inform customers of changes like cancelled flights.',
            style: subtextstyle,
          ),
          const Divider(
            color: kSubDominantcolor,
          ),
          const Row(
            children: [
              Text('Survice:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Expanded(
                  child: Text(
                'A travel agent is a highly organized professional who is passionate about travel and helping others. They are focused on creating the best possible experiences, directly catered to their clients. They work with hotels, airlines, and',
                style: subtextstyle,
              )),
            ],
          )
        ],
      ),
    );
  }
}
