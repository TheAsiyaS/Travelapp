import 'package:flutter/material.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/presentation/Home/Home.dart';
import 'package:travelapp/widgets/OnlyImageBox.dart';
import 'package:travelapp/widgets/SearchItemDetailed.dart';

class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height / 1.5,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SearchItemDetailed(
                              imageurl: '',
                              suburls: [],
                              price: 'price',
                              title: 'title',
                              subtitle: 'subtitle',
                              rating: 'rating',
                              reviewNo: 'reviewNo',
                              obj: 'obj')));
                    },
                    child: Container(
                      height: size.height / 2.5,
                      width: size.width / 1.7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://assets.traveltriangle.com/blog/wp-content/uploads/2019/12/Gurudongmar-Lake_2nd-dec.jpg'),
                            fit: BoxFit.cover,
                            opacity: 70,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: SizedBox(
                              height: 50,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return OnlyimageBoxWidget(
                                        height: 50,
                                        width: 50,
                                        boxdecoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    homeimageurls[index]),
                                                fit: BoxFit.fill)),
                                        childwidget: const Column(
                                          children: [],
                                        ));
                                  },
                                  separatorBuilder: (context, index) {
                                    return w20;
                                  },
                                  itemCount: homeimageurls.length),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return h10;
                },
                itemCount: 10),
          ),
        ],
      ),
    );
  }
}
