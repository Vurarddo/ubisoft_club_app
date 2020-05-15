import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ubisoft_club_app/widgets/scaffold_body_wrapper.dart';
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
    final icon = window.platformBrightness == Brightness.light
        ? 'assets/images/ubisoft_club_white.png'
        : 'assets/images/ubisoft_club_orange.png';

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: SizedBox(
          height: 50,
          child: Image.asset(
            icon,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      body: ScaffoldBodyWrapper(
        child: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Text $index',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
