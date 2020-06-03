import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ubisoft_club_app/features/more/more_screen_presenter.dart';
import 'package:ubisoft_club_app/localization.dart';

class MoreScreen extends StatefulWidget {
  static const _routeName = '/settings';

  static PageRoute<MoreScreen> getPageRoute() {
    final routeSettings = RouteSettings(name: _routeName);

    return MaterialPageRoute(
      settings: routeSettings,
      builder: _builder,
    );
  }

  static Widget _builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MoreScreenPresenter(),
      child: MoreScreen(),
    );
  }

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  UbisoftClubLocalizations get _localization =>
      UbisoftClubLocalizations.of(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_localization.more),
      ),
      body: Center(
        child: Text(_localization.more),
      ),
    );
  }
}
