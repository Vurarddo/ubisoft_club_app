import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ubisoft_club_app/features/games/games_screen_presenter.dart';
import 'package:ubisoft_club_app/localization.dart';

class GamesScreen extends StatefulWidget {
  static const _routeName = '/games';

  static PageRoute<GamesScreen> getPageRoute() {
    final routeSettings = RouteSettings(name: _routeName);

    return MaterialPageRoute(
      settings: routeSettings,
      builder: _builder,
    );
  }

  static Widget _builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GamesScreenPresenter(),
      child: GamesScreen(),
    );
  }

  @override
  _GamesScreenState createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  UbisoftClubLocalizations get _localization =>
      UbisoftClubLocalizations.of(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_localization.games),
      ),
      body: Container(),
    );
  }
}
