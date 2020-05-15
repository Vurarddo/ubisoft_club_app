import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ubisoft_club_app/localization.dart';
import 'package:ubisoft_club_app/features/games/games_screen_presenter.dart';
import 'package:ubisoft_club_app/theme/colors.dart';
import 'package:ubisoft_club_app/widgets/scaffold_body_wrapper.dart';

class SamScreen extends StatefulWidget {
  static const _routeName = '/sam';

  static PageRoute<SamScreen> getPageRoute() {
    final routeSettings = RouteSettings(name: _routeName);

    return MaterialPageRoute(
      settings: routeSettings,
      builder: _builder,
    );
  }

  static Widget _builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GamesScreenPresenter(),
      child: SamScreen(),
    );
  }

  @override
  _SamScreenState createState() => _SamScreenState();
}

class _SamScreenState extends State<SamScreen> {
  UbisoftClubLocalizations get _localization =>
      UbisoftClubLocalizations.of(context);

  ThemeData get _theme => Theme.of(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildTitle(),
        backgroundColor: _theme.accentColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ScaffoldBodyWrapper(
        wavesColor: _theme.accentColor,
        child: Container(),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'sam_bot',
        child: Icon(
          Icons.send,
          size: 30.0,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(right: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            _localization.sam,
          ),
          Text(
            ' ${_localization.beta.toLowerCase()}',
            style: _theme.textTheme.overline.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
