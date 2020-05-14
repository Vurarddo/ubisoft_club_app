import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class Waves extends StatefulWidget {
  final Color color;
  final double height;
  Waves({
    Key key,
    @required this.color,
    @required this.height,
  })  : assert(color != null),
        assert(height != null),
        super(key: key);

  @override
  _WavesState createState() => _WavesState();
}

class _WavesState extends State<Waves> with SingleTickerProviderStateMixin {
  AnimationController _waveAnimationController;
  Animation<double> _animation;

  @override
  void initState() {
    _waveAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 8),
    );

    _animation =
        Tween<double>(begin: 0, end: 1).animate(_waveAnimationController);

    _waveAnimationController.repeat();

    super.initState();
  }

  @override
  void dispose() {
    _waveAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _waveAnimationController,
      builder: (context, _) {
        return RotatedBox(
          quarterTurns: 10,
          child: Container(
            height: widget.height,
            width: double.infinity,
            child: CustomPaint(
              painter: _WavesPainter(
                waveAnimationValue: _animation.value,
                backgroundColor: Colors.transparent,
                waveColor: widget.color,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _WavesPainter extends CustomPainter {
  final double waveAnimationValue;
  final Color backgroundColor;
  final Color waveColor;

  _WavesPainter({
    @required this.waveAnimationValue,
    @required this.backgroundColor,
    @required this.waveColor,
  })  : assert(waveAnimationValue != null),
        assert(backgroundColor != null),
        assert(waveColor != null);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = waveColor.withOpacity(0.4)
      ..style = PaintingStyle.fill;

    Path firstWave = _buildFirstWaveFromSize(size);
    Path secondWave = _buildSecondWaveFromSize(size);
    Path thirdWave = _buildThirdWaveFromSize(size);

    canvas
      ..drawPath(thirdWave, paint)
      ..drawPath(firstWave, paint..color = waveColor)
      ..drawPath(secondWave, paint..color = waveColor.withOpacity(0.4));
  }

  Path _buildFirstWaveFromSize(Size size) {
    final center = size.height / 1.4;
    final transformation = translation(size.width, 1);

    return SymmetricWavePathBuilder(
      screenBounds: size,
      axisCenter: center,
      waveHeight: size.height - center,
      segmentCount: 1,
      width: size.width * 4,
    ).build().transform(transformation);
  }

  Path _buildSecondWaveFromSize(Size size) {
    final center = size.height / 1.8;
    final waveHeight = min(size.height - center, center);
    final transformation = translation(size.width, 2);

    return SymmetricWavePathBuilder(
      screenBounds: size,
      axisCenter: center,
      waveHeight: waveHeight,
      segmentCount: 1,
      width: size.width * 4,
    ).build().transform(transformation);
  }

  Path _buildThirdWaveFromSize(Size size) {
    final center = size.height / 1.6;
    final waveHeight = min(size.height - center, center);
    final transformation = translation(size.width, 3);

    return SymmetricWavePathBuilder(
      screenBounds: size,
      axisCenter: center,
      waveHeight: waveHeight,
      segmentCount: 1,
      width: size.width * 4,
    ).build().transform(transformation);
  }

  Float64List translation(double width, double speed) =>
      Matrix4.translationValues(width * waveAnimationValue * speed, 0, 0)
          .storage;

  @override
  bool shouldRepaint(_WavesPainter oldDelegate) {
    return oldDelegate.waveAnimationValue != waveAnimationValue;
  }
}

class SymmetricWavePathBuilder {
  final Size _screenBounds;
  final double _axisCenter;
  final double _waveHeight;
  final double _segmentCount;
  final double _width;

  final double _segmentWidth;
  final Path _segment = Path();
  final Path _wave = Path();

  SymmetricWavePathBuilder({
    @required Size screenBounds,
    @required double axisCenter,
    @required double waveHeight,
    @required double segmentCount,
    @required double width,
  })  : assert(screenBounds != null),
        assert(axisCenter != null),
        assert(waveHeight != null),
        assert(segmentCount != null),
        assert(width != null),
        _screenBounds = screenBounds,
        _axisCenter = axisCenter,
        _waveHeight = waveHeight,
        _segmentCount = segmentCount,
        _width = width,
        _segmentWidth = screenBounds.width / segmentCount;

  Path build() {
    _buildFullScreenWave();
    for (double currentWidth = 0;
        currentWidth <= _width;
        currentWidth += _screenBounds.width) {
      _wave.addPath(_segment, Offset(-currentWidth, 0));
    }

    return _wave;
  }

  void _buildFullScreenWave() {
    _buildSegment();

    for (int i = 0; i <= _segmentCount; i++) {
      _wave.addPath(_segment, Offset(_segmentWidth * i, 0));
    }
  }

  Path _buildSegment() {
    // 1.4 calculated from cubic bezier formula
    Point firstControlPoint =
        Point<double>(_segmentWidth / 2, _axisCenter - _waveHeight * 3.3);
    Point secondControlPoint = _symmetricPoint(
        firstControlPoint, Point(_segmentWidth / 2, _axisCenter));

    return _segment
      ..moveTo(0.0, _axisCenter)
      ..cubicTo(
        firstControlPoint.x,
        firstControlPoint.y,
        secondControlPoint.x,
        secondControlPoint.y,
        _segmentWidth,
        _axisCenter,
      )
      //Closes part
      ..lineTo(_segmentWidth, _screenBounds.height)
      ..lineTo(0, _screenBounds.height)
      ..close();
  }

  Point _symmetricPoint(Point<double> source, Point<double> center) {
    return center + (center - source);
  }
}
