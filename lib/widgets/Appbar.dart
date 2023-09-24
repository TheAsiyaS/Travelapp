import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/presentation/Hotels/HotelSearchDeatil.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';
import 'package:travelapp/widgets/CupertinoTextfield.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/widgets/IconButton.dart';

class SimpleAppbar extends StatelessWidget {
  const SimpleAppbar({
    super.key,
    required this.size,
    required this.id,
  });

  final Size size;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kDominantcolor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 50,
                  width: size.width / 1.3,
                  child: CupertinotextfieldWidget(
                      onchanged: (value) {},
                      onsubmitted: (value) {
                        if (id == 'HotelSearchBar') {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const HotelSearchDetailed()));
                        } else {}
                      },
                      placeholderText: 'Search your hapiness......',
                      placeholderStyle: const TextStyle(color: kwhite),
                      boxDecoration: BoxDecoration(
                          color: kdominatgrey,
                          borderRadius: BorderRadius.circular(15)),
                      prefixWidget: w10,
                      suffixWidget: h10,
                      keybodtype: TextInputType.name,
                      obscureText: false,
                      style: const TextStyle()),
                ),
                ConatinerwithWidget(
                  height: 50,
                  width: 50,
                  containerdecoration: BoxDecoration(
                      color: kdominatgrey,
                      borderRadius: BorderRadius.circular(15)),
                  childwidget: IconButtonWidget(
                      onPressFunc: () {
                        if (id == 'HotelSearchBar') {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => const HotelList()));
                        }
                      },
                      iconwidget: const Icon(
                        klistdash,
                        color: kwhite,
                      )),
                ),
              ],
            ), //https://previews.123rf.com/images/kitleong/kitleong1510/kitleong151000085/46555900-spring-flowers-cherry-tree-blossom-at-mito-ibaraki-near-tokoyo.jpg
          ),
        ],
      ),
    );
  }
}
