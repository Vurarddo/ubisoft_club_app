import 'dart:math' as math;

import 'package:flutter/material.dart';

class CircleProgressBar extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final double progressValue;

  const CircleProgressBar({
    Key key,
    @required this.foregroundColor,
    @required this.progressValue,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progress = (progressValue <= 1 ? progressValue * 100 : 100).toStringAsFixed(0);
    final theme = Theme.of(context);

    return AspectRatio(
      aspectRatio: 1,
      child: CustomPaint(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                progress,
                style: theme.textTheme.display1.copyWith(color: Colors.white),
              ),
              Text(
                '%',
                style: theme.textTheme.title.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        foregroundPainter: CircleProgressBarPainter(
          radius: 60,
          percentage: progressValue,
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
        ),
      ),
    );
  }
}

class CircleProgressBarPainter extends CustomPainter {
  final double radius;
  final double thickness;
  final double percentage;
  final Color foregroundColor;
  final Color backgroundColor;
  final double _secondRadius;
  // TODO: add color

  CircleProgressBarPainter({
    @required this.radius,
    @required this.percentage,
    this.thickness = 10,
    this.foregroundColor,
    this.backgroundColor,
  })  : _secondRadius = radius - thickness,
        assert(radius != null),
        assert(thickness != null),
        assert(percentage != null),
        assert(foregroundColor != null);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = foregroundColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    Paint centerLinePaint = Paint()
      ..color = foregroundColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = thickness + 1;

    final startAngle = math.pi * 1.5;
    final center = size.center(Offset.zero);
    final coordinate = (2 * math.pi * (percentage ?? 0.0)) + startAngle;
    final centerLineCoordinate = 2 * math.pi * (percentage ?? 0.0);
    final dotX = radius * math.cos(coordinate);
    final dotY = radius * math.sin(coordinate);
    final secondDotX = _secondRadius * math.cos(coordinate);
    final secondDotY = _secondRadius * math.sin(coordinate);

    // Don't draw the background if we don't have a background color
    if (backgroundColor != null) {
      final backgroundPaint = Paint()
        ..color = backgroundColor
        ..strokeWidth = thickness + 1
        ..style = PaintingStyle.stroke;
      canvas.drawCircle(center, radius - (thickness * 0.5), backgroundPaint);
    }

    Path path = Path();
    path
      ..moveTo(center.dx, center.dy - radius)
      ..lineTo(center.dx, center.dy - _secondRadius)
      ..moveTo(center.dx + dotX, center.dy + dotY)
      ..lineTo(center.dx + secondDotX, center.dy + secondDotY);

    Path centerPath = Path();
    centerPath
      ..addArc(
        Rect.fromCircle(radius: radius - (thickness * 0.5), center: center),
        startAngle,
        centerLineCoordinate,
      );

    canvas.drawPath(path, paint);
    canvas.drawPath(centerPath, centerLinePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final oldPainter = (oldDelegate as CircleProgressBarPainter);
    return oldPainter.radius != radius ||
        oldPainter.thickness != thickness ||
        oldPainter.percentage != percentage ||
        oldPainter._secondRadius != _secondRadius;
  }
}
