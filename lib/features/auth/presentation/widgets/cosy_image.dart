import 'package:flutter/material.dart';

class COSYImage extends StatelessWidget {
  const COSYImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      child: Image.asset(
        "assets/images/COSY.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
