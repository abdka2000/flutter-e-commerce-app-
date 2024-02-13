import 'package:flutter/material.dart';

class HighText extends StatelessWidget {
  final String text;
  const HighText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
          height: 0.9,
          color: Colors.white,
          fontSize: 35,
          fontWeight: FontWeight.w100),
    );
  }
}
