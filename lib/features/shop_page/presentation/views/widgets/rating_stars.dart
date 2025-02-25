import 'package:flutter/material.dart';

class RatingStarsOfProduct extends StatelessWidget {
  const RatingStarsOfProduct({
    super.key, required this.size,
  });
final double size;
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
