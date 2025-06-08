import 'package:flutter/material.dart';

class CoustmText extends StatelessWidget {
  const CoustmText({
    super.key,
    required this.text,
    required this.color,
    this.textsize,
    this.undrline,
  });
  final String text;
  final Color color;
  final double? textsize;
  final TextDecoration? undrline;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        decoration: undrline,
        fontSize: textsize ?? 24,
        color: color,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
