import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:ubisoft_club_app/theme/colors.dart';

class CircleProgressBar extends StatelessWidget {
  final double progressValue;
  final double thickness;
  final double radius;
  final Color backgroundColor;
  final Color foregroundColor;
  final Gradient gradient;
  final Gradient completeGradient;

  const CircleProgressBar({
    Key key,
    @required this.progressValue,
    this.thickness = 10,
    this.radius = 60,
    this.foregroundColor = orangeAccent,
    this.backgroundColor,
    this.gradient = const LinearGradient(
      colors: [Colors.orangeAccent, Colors.deepOrangeAccent],
      end: Alignment.topLeft,
      begin: Alignment.topRight,
      tileMode: TileMode.repeated,
    ),
    this.completeGradient = const LinearGradient(
      colors: [Colors.lightGreenAccent, Colors.lightGreen],
      tileMode: TileMode.repeated,
    ),
  })  : assert(progressValue != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AspectRatio(
      aspectRatio: 1,
      child: CustomPaint(
        child: Padding(
          padding: EdgeInsets.only(left: progressValue >= 100 ? 0.0 : 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${progressValue.toStringAsFixed(0)}',
                style: theme.textTheme.headline4.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '%',
                style: theme.textTheme.headline6,
              ),
            ],
          ),
        ),
        foregroundPainter: CircleProgressBarPainter(
          radius: radius,
          percentage: progressValue / 100,
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          completeGradient: completeGradient,
          gradient: gradient,
          thickness: thickness,
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
  final Gradient gradient;
  final Gradient completeGradient;
  final double _secondRadius;

  CircleProgressBarPainter({
    @required this.radius,
    @required this.percentage,
    @required this.gradient,
    @required this.completeGradient,
    this.thickness = 10,
    this.foregroundColor,
    this.backgroundColor,
  })  : _secondRadius = radius - thickness,
        assert(radius != null),
        assert(thickness != null),
        assert(percentage != null),
        assert(gradient != null),
        assert(completeGradient != null),
        assert(foregroundColor != null);

  @override
  void paint(Canvas canvas, Size size) {
    final startAngle = math.pi * 1.5;
    final center = size.center(Offset.zero);
    final centerLineCoordinate = 2 * math.pi * (percentage ?? 0.0);
    final rect = Rect.fromCircle(center: center, radius: radius);
    final gradientColor = percentage == 1 ? completeGradient : gradient;

    Paint paint = Paint()
      ..color = foregroundColor
      ..shader = gradientColor.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = thickness + 1;

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
      ..addArc(
        Rect.fromCircle(radius: radius - (thickness * 0.5), center: center),
        startAngle,
        centerLineCoordinate,
      );

    canvas.drawPath(path, paint);
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
