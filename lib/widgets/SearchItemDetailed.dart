import 'package:flutter/material.dart';
import 'package:travelapp/common/Icons.dart';
import 'package:travelapp/common/Sizedboxes.dart';
import 'package:travelapp/common/Styles.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/widgets/ContainerWithWidget.dart';

class SearchItemDetailed extends StatelessWidget {
  const SearchItemDetailed({super.key, required this.imageurl, required this.suburls, required this.price, required this.title, required this.subtitle, required this.rating, required this.reviewNo, required this.obj});

  final String imageurl;

  final List<String> suburls;
  final String price;
  final String title;
  final String subtitle;
  final String rating;
  final String reviewNo;
  final String obj;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ktransparent,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConatinerwithWidget(
                containerdecoration: BoxDecoration(
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://d27k8xmh3cuzik.cloudfront.net/wp-content/uploads/2017/12/shutterstock_7024083491.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20)),
                childwidget: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      h10,
                      ConatinerwithWidget(
                          containerdecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://hips.hearstapps.com/hmg-prod/images/harpers-ferry-west-virginia-royalty-free-image-1660073165.jpg'),
                                  fit: BoxFit.cover)),
                          childwidget: h10,
                          height: 50,
                          width: 50),
                      ConatinerwithWidget(
                          containerdecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://hips.hearstapps.com/hmg-prod/images/harpers-ferry-west-virginia-royalty-free-image-1660073165.jpg'),
                                  fit: BoxFit.cover)),
                          childwidget: h10,
                          height: 50,
                          width: 50),
                      ConatinerwithWidget(
                          containerdecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://www.edreams.pt/blog/wp-content/uploads/sites/4/2017/03/Seoul-coreia-primavera.jpg'),
                                  fit: BoxFit.cover)),
                          childwidget: h10,
                          height: 50,
                          width: 50),
                    ],
                  ),
                ),
                height: size.height / 2,
                width: size.width),
            h10,
            const Text(
              'Country Name',
              style: textstyle,
            ),
            h10,
            const Text(
              'Something about the country that you want visit like safety , beauty ,Quality of air , Purity of water   ',
              style: subtextstyle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            h10,
            ratingbar,
            h20,
            const Text(
              'Review',
              style: textstyle,
            ),
            SizedBox(
                height: size.height / 1.6,
                width: size.width,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return const ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://www.adobe.com/acrobat/hub/media_173d13651460eb7e12c0ef4cf8410e0960a20f0ee.jpeg?width=1200&format=pjpg&optimize=medium'),
                        ),
                        title: Text('Username'),
                        subtitle: Text(
                            'Reviwe of the user will be shown here like they love our app they will be join our premium plan'),
                        trailing: Icon(kcheck, color: kSubDominantcolor),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: 15))
          ],
        ),
      ),
    );
  }
}
