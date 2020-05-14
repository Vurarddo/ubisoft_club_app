import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubisoft_club_app/features/home/home_screen_presenter.dart';

class HomeScreen extends StatefulWidget {
  static const _routeName = '/home';

  static PageRoute<HomeScreen> getPageRoute() {
    final routeSettings = RouteSettings(name: _routeName);

    if (Platform.isIOS) {
      CupertinoPageRoute(
        settings: routeSettings,
        builder: _builder,
      );
    }

    return MaterialPageRoute(
      settings: routeSettings,
      builder: _builder,
    );
  }

  static Widget _builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenPresenter(),
      child: HomeScreen(),
    );
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: 50,
          child: Image.asset(
            'assets/images/ubisoft_club.png',
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      body: Container(),
    );
  }
}
