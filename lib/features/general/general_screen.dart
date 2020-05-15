import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ubisoft_club_app/features/general/general_screen_presenter.dart';
import 'package:ubisoft_club_app/features/general/general_widgets/general_card.dart';

class GeneralScreen extends StatefulWidget {
  static const _routeName = '/general';

  static PageRoute<GeneralScreen> getPageRoute() {
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
      create: (context) => GeneralScreenPresenter(),
      child: GeneralScreen(),
    );
  }

  @override
  _GeneralScreenState createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: SizedBox(
          height: 50,
          child: Image.asset(
            'assets/images/ubisoft_club_orange.png',
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      body:
      ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GeneralCard(),
          );
        },
      ),
    );
  }
}
