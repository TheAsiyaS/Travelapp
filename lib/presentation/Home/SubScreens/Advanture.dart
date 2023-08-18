import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';

class Adavanture extends StatelessWidget {
  const Adavanture({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              height: size.height / 2,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: GridView.custom(
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 2,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 20,
                      repeatPattern: QuiltedGridRepeatPattern.inverted,
                      pattern: [
                        const QuiltedGridTile(2, 1),
                        const QuiltedGridTile(1, 1),
                        const QuiltedGridTile(1, 1),
                        const QuiltedGridTile(1, 1),
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(childCount: 30,
                        (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => PostListPage(
                          //         posts: snapshot.data!.docs,
                          //         initialPostIndex: index)
                          //  ) );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://images.unsplash.com/photo-1506946526854-9aad1ec915cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnJpZGdlfGVufDB8fDB8fHww&w=1000&q=80'),
                                  fit: BoxFit.cover)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Text(
                                      'Londan',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    ConatinerwithWidget(
                                        containerdecoration: BoxDecoration(
                                            color: kwhite,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        childwidget: const Icon(
                                          kfavorite,
                                          color: kRed,
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    })),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
