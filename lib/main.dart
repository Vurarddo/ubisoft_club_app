import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:ubisoft_club_app/infrastructure/environment_banner.dart';
import 'package:ubisoft_club_app/infrastructure/injector.dart';
import 'package:ubisoft_club_app/infrastructure/store_interactor.dart';
import 'package:ubisoft_club_app/theme/colors.dart';
import 'package:ubisoft_club_app/theme/theme.dart';
import 'package:ubisoft_club_app/localization.dart';
import 'package:ubisoft_club_app/widgets/home_layout.dart';
import 'package:ubisoft_club_app/models/models.dart';
import 'package:ubisoft_club_app/repos/news_repo/http_news_repo_impl.dart';
import 'package:ubisoft_club_app/repos/user_repo/http_user_repo_impl.dart';
import 'package:timeago/timeago.dart' as timeAgo;

Future<void> runUbisoftClubApp() async {
  // Injector
  injector
    ..register<NewsRepo>(HttpNewsRepoImpl())
    ..register<UserRepo>(HttpUserRepoImpl())
    ..register<StoreInteractor>(StoreInteractor())
    ..register<NewsFactory>(NewsFactory())
    ..register<UserFactory>(UserFactory())
    ..register<UserService>(UserService());

  // for time ago messages
  timeAgo.setLocaleMessages('ru', timeAgo.RuMessages());

  runApp(UbisoftClubApp());
}

const _supportedLocales = [
  Locale('en'),
  Locale('ru'),
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

class _UbisoftClubAppState extends State<UbisoftClubApp>
    with WidgetsBindingObserver {
  SystemUiOverlayStyle uiOverlayStyle = _getSystemNavigationBarColor();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    setState(() {
      uiOverlayStyle = _getSystemNavigationBarColor();
    });
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: uiOverlayStyle,
      child: EnvironmentBanner(
        child: _buildMaterialApp(),
      ),
    );
  }

  MaterialApp _buildMaterialApp() {
    return MaterialApp(
      title: 'Ubisoft Club App',
      supportedLocales: _supportedLocales,
      localizationsDelegates: _localizationsDelegate,
      theme: appThemeData[AppTheme.light],
      darkTheme: appThemeData[AppTheme.dark],
      onGenerateRoute: _onGenerateRoute,
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    return HomeLayout.getRoute();
  }

  static SystemUiOverlayStyle _getSystemNavigationBarColor() {
    return window.platformBrightness == Brightness.light
        ? SystemUiOverlayStyle.light
            .copyWith(systemNavigationBarColor: Colors.grey[50])
        : SystemUiOverlayStyle.dark
            .copyWith(systemNavigationBarColor: grey850.withOpacity(0.98));
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
