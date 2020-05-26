import 'package:flutter/material.dart';

class CongratulatoryProgressBar extends StatelessWidget {
  final int value;
  final double thickness;
  final double radius;

  const CongratulatoryProgressBar({
    Key key,
    @required this.value,
    this.thickness = 5,
    this.radius = 60,
  })  : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gradient = LinearGradient(
      colors: [Colors.yellow[700], Colors.yellow[800]],
      end: Alignment.topLeft,
      begin: Alignment.topRight,
      tileMode: TileMode.repeated,
    );

    return AspectRatio(
      aspectRatio: 1,
      child: CustomPaint(
        child: Center(
          child: Text(
            '$value',
            style: theme.textTheme.headline4.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.yellow[600],
            ),
          ),
        ),
        foregroundPainter: CircleProgressBarPainter(
          radius: radius,
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
  final Gradient gradient;

  CircleProgressBarPainter({
    @required this.radius,
    @required this.gradient,
    this.thickness = 10,
  })  : assert(radius != null),
        assert(thickness != null),
        assert(gradient != null);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final rect = Rect.fromCircle(center: center, radius: radius);

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = thickness + 1
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius - (thickness * 0.5), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final oldPainter = (oldDelegate as CircleProgressBarPainter);
    return oldPainter.radius != radius || oldPainter.thickness != thickness;
  }
}
