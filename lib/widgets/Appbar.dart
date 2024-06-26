
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/presentation/Hotels/HotelSearchDeatil.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';
import 'package:travelapp/widgets/CupertinoTextfield.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/widgets/IconButton.dart';
import 'package:travelapp/widgets/SnackbarWidget.dart';

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
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
        final hotelController = TextEditingController();

    return Container(
      decoration: const BoxDecoration(
        color: kDominantcolor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
        ),
      ),
      child: Scaffold(
        key: scaffoldKey,
        body: Container(
          decoration: const BoxDecoration(
              color: kDominantcolor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
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
                        controller: hotelController,
                          onchanged: (value) {},
                          onsubmitted: (value) async {
                            if (id == 'HotelSearchBar') {
                              if (value.contains('hotel') ||
                                  value.contains('Hotel')) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HotelSearchDetailed(
                                          querry: value,
                                        )));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        backgroundColor: kRed,
                                        content: SnackbarWidget(
                                            icon: kclose,
                                            message:
                                                'Your searched query isn\'t correct and may cause incorrect data.\n Please add "hotel" to the query.')));

                                await Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HotelSearchDetailed(
                                              querry: value,
                                            )));
                              }
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*

*/