import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ubisoft_club_app/features/settings/settings_screen_presenter.dart';
import 'package:ubisoft_club_app/localization.dart';

class SettingsScreen extends StatefulWidget {
  static const _routeName = '/settings';

  static PageRoute<SettingsScreen> getPageRoute() {
    final routeSettings = RouteSettings(name: _routeName);

    return MaterialPageRoute(
      settings: routeSettings,
      builder: _builder,
    );
  }

  static Widget _builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingsScreenPresenter(),
      child: SettingsScreen(),
    );
  }

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  UbisoftClubLocalizations get _localization =>
      UbisoftClubLocalizations.of(context);
  ThemeData get _theme => Theme.of(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _theme.dividerColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(_localization.settings),
      ),
      body: Center(
        child: Text(_localization.settings),
      ),
    );
  }
}
