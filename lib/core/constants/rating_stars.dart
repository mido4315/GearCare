import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({
    super.key,
    required this.size,
    required this.fontSize,
  });

  final double size;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.star,
              color: Colors.grey,
              size: size,
            ),
            Icon(
              Icons.star,
              color: Colors.amber,
              size: size,
            ),
            Icon(
              Icons.star,
              color: Colors.amber,
              size: size,
            ),
            Icon(
              Icons.star,
              color: Colors.amber,
              size: size,
            ),
            Icon(
              Icons.star,
              color: Colors.amber,
              size: size,
            ),
          ],
        ),
        Text(
          '4.0 (140 reviews)',
          style: TextStyle(
              fontSize: fontSize, color: Colors.black.withOpacity(.65)),
        )
      ],
    );
  }
}