import 'package:e_commerce/core/string/colors.dart';
import 'package:flutter/material.dart';

class RatingReviews extends StatelessWidget {
  const RatingReviews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            Icon(
              Icons.star_rate_rounded,
              color: AppColors.orange,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "4.8",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            )
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        const Row(
          children: [
            Icon(
              Icons.comment_outlined,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "9 reviews",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            )
          ],
        ),
      ],
    );
  }
}
