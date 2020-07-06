import 'package:flutter/material.dart';

import 'package:ubisoft_club_app/models/models.dart';

class GameCard extends StatelessWidget {
  final Game game;

  const GameCard({
    Key key,
    @required this.game,
  })  : assert(game != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(game.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
