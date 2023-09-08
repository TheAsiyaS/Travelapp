import 'package:flutter/material.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/SearchItemDetailed.dart';

class Beach extends StatelessWidget {
  const Beach({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Expanded(
          child: SizedBox(
            height: size.height / 3,
            width: size.width,
            child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1 / 1.2,
                children: List.generate(
                  10,
                  (index) =>GestureDetector(
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://assets.traveltriangle.com/blog/wp-content/uploads/2015/07/Marari-Beach-in-Alleppey.jpg'),
                                fit: BoxFit.cover)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: size.height / 9,
                                width: size.width,
                                decoration: BoxDecoration(
                                    color: kDominantTrans,
                                    borderRadius: BorderRadius.circular(20)),
                                child:const Padding(
                                  padding:  EdgeInsets.all(8.0),
                                  child:   Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Kollam Beach",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        ' a narrow strip of land separating a body of water from inland areas ',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
