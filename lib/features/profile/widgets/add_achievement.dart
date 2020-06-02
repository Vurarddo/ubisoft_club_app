import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class AddAchievement extends StatelessWidget {
  final double size;
  final Color color;
  final IconData icon;

  const AddAchievement({
    Key key,
    this.size = 70.0,
    this.color = Colors.black,
    @required this.icon,
  })  : assert(icon != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.square(size),
      child: DottedBorder(
        color: color,
        borderType: BorderType.RRect,
        dashPattern: [5.6, 3.5],
        customPath: _customPath,
        child: Center(
          child: Icon(icon, color: color),
        ),
      ),
    );
  }

  Path _customPath(Size size) {
    return _HexagonClipper().getClip(size);
  }
}

class _HexagonClipper extends CustomClipper<Path> {
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
  bool shouldReclip(_HexagonClipper oldClipper) => false;
}
