import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RatingBar.builder(
            initialRating: rating,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemSize: 24,
            onRatingUpdate: (rating) {},
            ignoreGestures: true,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Text(
              rating.toString(),
              style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(.65)),
            ),
          )
        ],
      ),
    );
  }
}