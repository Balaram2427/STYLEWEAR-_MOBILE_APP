import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  final int rating;
  final int maxRating;
  final Color filledStarColor;
  final Color unfilledStarColor;
  final double starSize;

  const RatingStar({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.filledStarColor = Colors.yellow,
    this.unfilledStarColor = Colors.grey,
    this.starSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxRating, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: index < rating ? filledStarColor : unfilledStarColor,
          size: starSize,
        );
      }),
    );
  }
}
