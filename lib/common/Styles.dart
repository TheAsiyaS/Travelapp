import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travelapp/common/colours.dart';


const textstyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 25);
const subtextstyle = TextStyle(color: kgrey);
const textstylewhite = TextStyle(color: kwhite);

final ratingbar = SizedBox(
  height: 30,
  width: 230,
  child: RatingBar.builder(
    itemSize: 40,
    initialRating: 5,
    minRating: 1,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemCount: 5,
    itemPadding: const EdgeInsets.symmetric(horizontal: 1),
    itemBuilder: (context, _) => Transform.scale(
      scale: .4, // Adjust this value to reduce the size
      child: const Icon(
        Icons.star,
        color: kamber,
      ),
    ),
    onRatingUpdate: (double value) {},
  ),
);
