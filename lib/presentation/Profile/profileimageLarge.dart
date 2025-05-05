import 'package:flutter/material.dart';
import 'package:travelapp/common/colours.dart';
import 'package:travelapp/main.dart';

class ProfileLarge extends StatelessWidget {
  const ProfileLarge({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ValueNotifier<String> profileImage =
        ValueNotifier<String>(currentuserdata.value.photoUrl);

    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          profileImage.value =
              profileImage.value == currentuserdata.value.photoUrl
                  ? currentuserdata.value.scondaryImage
                  : currentuserdata.value.photoUrl;
        },
        child: const Icon(
          Icons.arrow_drop_down_circle,
          size: 60,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(backgroundColor: ktransparent,),
      extendBodyBehindAppBar: true,
      body: ValueListenableBuilder<String>(
        valueListenable: profileImage,
        builder: (context, imageUrl, _) {
          return Column(
            children: [
              Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
