import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';
import 'package:ubisoft_club_app/localization.dart';
import 'package:ubisoft_club_app/widgets/waves.dart';

class GeneralCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.cardColor,
      padding: EdgeInsets.only(top: 12.0),
      child: Column(
        children: <Widget>[
          _buildProfileListTile(context),
          _buildDivider(),
          GestureDetector(
            onTap: () {
              // TODO: add navigation
            },
            child: _buildGameCard(context),
          ),
          _buildAddToFavoriteTile(context),
        ],
      ),
    );
  }

  Widget _buildProfileListTile(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      onTap: () {
        // TODO: add navigation
      },
      leading: SizedBox.fromSize(
        size: Size.square(50),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset('assets/images/avatar.jpg'),
        ),
      ),
      title: Text(
        'VladOS',
        style: theme.textTheme.subhead.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '2 hours ago',
            style: theme.textTheme.caption,
          ),
          Text(
            'Tom Clancy\'s Rainbow Six Siege',
            style: theme.textTheme.caption,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      indent: 16,
      endIndent: 16,
      thickness: 1,
      height: 20,
    );
  }

  Widget _buildGameCard(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 10.0),
          child:
              Text('The Grand Larceny: 50% еженедельных испытаний завершено'),
        ),
        Stack(
          children: <Widget>[
            Image.asset('assets/images/game_image.jpg'),
            Positioned(
              top: 35,
              right: MediaQuery.of(context).size.width / 3,
              child: SizedBox.fromSize(
                size: Size.square(120),
                child: CircleProgressBar(
                  value: .9,
                  foregroundColor: Colors.red,
                  backgroundColor: theme.unselectedWidgetColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAddToFavoriteTile(BuildContext context) {
    final localization = UbisoftClubLocalizations.of(context);
    final theme = Theme.of(context);

    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.favorite_border,
            color: theme.highlightColor,
          ),
          onPressed: () {
            // TODO: add action
          },
        ),
        Text(localization.like),
      ],
    );
  }
}

class CircleProgressBar extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final double value;

  const CircleProgressBar({
    Key key,
    this.backgroundColor,
    @required this.foregroundColor,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gradient = SweepGradient(
      colors: [Pigment.fromString('#22c9c1'), Pigment.fromString('#016770')],
    );
    return AspectRatio(
      aspectRatio: 1,
      child: Transform.rotate(
        angle: -1.65,
        child: CustomPaint(
          child: Transform.rotate(
            angle: 1.65,
            child: Center(child: Text('50')),
          ),
          foregroundPainter: CircleProgressBarPainter(
            percentage: value,
            gradient: gradient,
            completeColor: Colors.green,
            backgroundColor: backgroundColor,
          ),
        ),
      ),
    );
  }
}

class CircleProgressBarPainter extends CustomPainter {
  final double percentage;
  final SweepGradient gradient;
  final Color completeColor;
  final Color backgroundColor;
  final double strokeWidth;

  CircleProgressBarPainter({
    @required this.percentage,
    @required this.gradient,
    this.completeColor,
    this.backgroundColor,
    this.strokeWidth = 10.0,
  })  : assert(percentage != null),
        assert(gradient != null);

  @override
  void paint(Canvas canvas, Size size) {
    final double startAngle = 0.1;
    final double sweepAngle = (2 * pi * (percentage ?? 0));
    final Offset center = size.center(Offset.zero);
    final Size constrainedSize = size - Offset(strokeWidth, strokeWidth);
    final shortestSide = min(constrainedSize.width, constrainedSize.height);
    final radius = (shortestSide / 2);
    final gradientColor = percentage == 1
        ? SweepGradient(colors: [completeColor, completeColor])
        : gradient;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final foregroundPaint = Paint()
      ..shader = gradientColor.createShader(rect)
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Don't draw the background if we don't have a background color
    if (backgroundColor != null) {
      final backgroundPaint = Paint()
        ..color = backgroundColor
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke;
      canvas.drawCircle(center, radius, backgroundPaint);
    }

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final oldPainter = (oldDelegate as CircleProgressBarPainter);
    return oldPainter.percentage != percentage ||
        oldPainter.gradient != gradient ||
        oldPainter.backgroundColor != backgroundColor ||
        oldPainter.strokeWidth != strokeWidth;
  }
}
