import 'package:flutter/material.dart';

import 'package:ubisoft_club_app/theme/colors.dart';
import 'package:ubisoft_club_app/features/profile/widgets/hexagon_clipper.dart';

class StatisticHexagon extends StatelessWidget {
  final int number;
  final double size;

  const StatisticHexagon({
    Key key,
    @required this.number,
    this.size = 60.0,
  })  : assert(number != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ClipPath(
      clipper: HexagonClipper(),
      child: Container(
        width: size,
        height: size,
        decoration: _decoration(),
        child: Center(
          child: Text(
            '$number',
            style: theme.textTheme.headline6.copyWith(color: Colors.grey[300]),
          ),
        ),
      ),
    );
  }

  Decoration _decoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [orangeAccent[700], orangeAccent],
        begin: Alignment.bottomLeft,
        end: Alignment.topCenter,
      ),
    );
  }
}
