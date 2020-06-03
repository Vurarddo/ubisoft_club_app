import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:ubisoft_club_app/features/profile/widgets/hexagon_clipper.dart';

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
    return HexagonClipper().getClip(size);
  }
}
