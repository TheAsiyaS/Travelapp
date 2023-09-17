import 'package:flutter/material.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';
import 'package:travelapp/widgets/IconButton.dart';

class AgentDetails extends StatelessWidget {
  const AgentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agent Name'),
        backgroundColor: ktransparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ConatinerwithWidget(
              containerdecoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://media.istockphoto.com/id/831902150/photo/ive-solidified-my-name-in-the-business-world.jpg?s=612x612&w=0&k=20&c=GCkoeN4GXE9W3EgNmwnInZpvGEepUSPd7N8NMKGBGFs='),
                      fit: BoxFit.cover)),
              childwidget: h10,
              height: size.height / 2,
              width: size.width),
          ratingbar,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Phone Number: 1234567890',
                style: TextStyle(fontSize: 18),
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
              const Text(
                'Email: abcxyz@gamil.com ',
                style: TextStyle(fontSize: 18),
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
