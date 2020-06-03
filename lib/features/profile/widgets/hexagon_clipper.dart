import 'package:flutter/material.dart';

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width * 0.5, size.height * 0.02)
      ..lineTo(size.width * 0.9, size.height * 0.25)
      ..lineTo(size.width * 0.9, size.height * 0.75)
      ..lineTo(size.width * 0.5, size.height * 0.97)
      ..lineTo(size.width * 0.1, size.height * 0.75)
      ..lineTo(size.width * 0.1, size.height * 0.25)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(HexagonClipper oldClipper) => false;
}
