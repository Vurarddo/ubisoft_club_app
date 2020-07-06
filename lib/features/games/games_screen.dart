import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ubisoft_club_app/features/game_info/game_info_screen.dart';
import 'package:ubisoft_club_app/features/games/game_card.dart';
import 'package:ubisoft_club_app/features/games/games_screen_presenter.dart';
import 'package:ubisoft_club_app/localization.dart';
import 'package:ubisoft_club_app/models/models.dart';
import 'package:ubisoft_club_app/widgets/platform_title.dart';

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
  GamesScreenPresenter get _presenter =>
      Provider.of<GamesScreenPresenter>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_localization.games),
      ),
      body: Center(
        child: !_presenter.isLoading
            ? GridView.builder(
                padding: EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _presenter.games.length,
                itemBuilder: _buildGames,
              )
            : CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildGames(context, index) {
    final game = _presenter.games[index];
    return Material(
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _navigateToGameInfo(game),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            GameCard(game: game),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformTitle(platform: game.platform),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToGameInfo(Game game) {
    Navigator.push(context, GameInfoScreen.getPageRoute(game));
  }
}
