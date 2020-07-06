import 'package:flutter/foundation.dart';

import 'package:ubisoft_club_app/models/models.dart';

class GameInfoScreenPresenter with ChangeNotifier {
  final Game game;
  GameInfoScreenPresenter({@required this.game}) : assert(game != null) {
    _init();
  }

  Future<void> _init() async {}
}
