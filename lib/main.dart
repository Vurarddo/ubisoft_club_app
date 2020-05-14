import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ubisoft_club_app/infrastructure/environment_banner.dart';

import 'package:ubisoft_club_app/theme.dart';
import 'package:ubisoft_club_app/localization.dart';
import 'package:ubisoft_club_app/features/home/home_screen.dart';

void runUbisoftClubApp() {
  // Injector

  runApp(UbisoftClubApp());
}

const _supportedLocales = [
  Locale('en'),
  Locale('ru'),
  Locale('uk'),
];

const List<LocalizationsDelegate> _localizationsDelegate = [
  UbisoftClubLocalizationsDelegate(),
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
];

class UbisoftClubApp extends StatefulWidget {
  @override
  _UbisoftClubAppState createState() => _UbisoftClubAppState();
}

class _UbisoftClubAppState extends State<UbisoftClubApp> {
  @override
  Widget build(BuildContext context) {
    return EnvironmentBanner(
      child: _buildMaterialApp(),
    );
  }

  MaterialApp _buildMaterialApp() {
    final theme = window.platformBrightness == Brightness.light
        ? appThemeData[AppTheme.light]
        : appThemeData[AppTheme.dark];

    return MaterialApp(
      title: 'Flutter Demo',
      supportedLocales: _supportedLocales,
      localizationsDelegates: _localizationsDelegate,
      theme: theme,
      onGenerateRoute: _onGenerateRoute,
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    return HomeScreen.getPageRoute();
  }
}
