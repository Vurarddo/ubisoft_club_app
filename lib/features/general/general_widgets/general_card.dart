import 'dart:math' as math;

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
                  progressValue: .5,
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
  final double progressValue;

  const CircleProgressBar({
    Key key,
    this.backgroundColor,
    @required this.foregroundColor,
    @required this.progressValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: CustomPaint(
        child: Center(
            child: Text(
          '50',
          style: TextStyle(color: Colors.white),
        )),
        foregroundPainter: CircleProgressBarPainter(
          radius: 60,
          percentage: progressValue,
        ),
      ),
    );
  }
}

class CircleProgressBarPainter extends CustomPainter {
  final double radius;
  final double thickness;
  final double percentage;
  final double _secondRadius;

  CircleProgressBarPainter({
    @required this.radius,
    @required this.percentage,
    this.thickness = 10,
  }) : _secondRadius = radius - thickness;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;
    final coordinate = 2 * math.pi * (percentage ?? 0.0);

    final dotX = radius * math.cos(coordinate);
    final dotY = radius * math.sin(coordinate);

    Path path = Path();
    path
      ..addArc(
          Rect.fromCircle(radius: radius, center: Offset.zero), 0.0, coordinate)
      ..addArc(Rect.fromCircle(radius: _secondRadius, center: Offset.zero), 0.0,
          coordinate)
      ..lineTo(dotX, dotY)
      ..moveTo(_secondRadius, 0.0)
      ..lineTo(radius, 0.0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
