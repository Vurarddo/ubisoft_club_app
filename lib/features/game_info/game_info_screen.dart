import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ubisoft_club_app/models/models.dart';
import 'package:ubisoft_club_app/features/game_info/game_info_screen_presenter.dart';

class GameInfoScreen extends StatefulWidget {
  static const _routeName = '/game_info';

  static PageRoute<GameInfoScreen> getPageRoute(Game game) {
    final routeSettings = RouteSettings(name: _routeName);

    return MaterialPageRoute(
      settings: routeSettings,
      builder: _builder(game),
    );
  }

  static WidgetBuilder _builder(Game game) {
    return (context) => ChangeNotifierProvider(
          create: (context) => GameInfoScreenPresenter(game: game),
          child: GameInfoScreen(),
        );
  }

  @override
  _GameInfoScreenState createState() => _GameInfoScreenState();
}

class _GameInfoScreenState extends State<GameInfoScreen> {
  GameInfoScreenPresenter get _presenter =>
      Provider.of<GameInfoScreenPresenter>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_presenter.game.title),
      ),
      body: Center(
        child: Text(_presenter.game.title),
      ),
    );
  }
}
