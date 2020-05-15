import 'package:flutter/material.dart';

import 'package:ubisoft_club_app/theme/colors.dart';

enum AppTheme { light, dark }

final appThemeData = {
  AppTheme.light: lightTheme,
  AppTheme.dark: darkTheme,
};

final lightTheme = ThemeData(
  primarySwatch: grey850,
  appBarTheme: AppBarTheme(
    elevation: 0,
    iconTheme: darkIconTheme,
  ),
  pageTransitionsTheme: _pageTransitionTheme,
  iconTheme: IconThemeData(color: orangeAccent),
  secondaryHeaderColor: Colors.grey[850],
  bottomAppBarColor: Colors.white,
  accentColor: orangeAccent,
  disabledColor: Colors.grey,
);

final darkTheme = ThemeData(
  primarySwatch: grey850,
  appBarTheme: AppBarTheme(
//    textTheme: ,
    elevation: 0,
    iconTheme: darkIconTheme,
  ),
  iconTheme: darkIconTheme,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Colors.grey[300],
  ),
  secondaryHeaderColor: Colors.grey[850],
  bottomAppBarColor: Colors.grey[850],
  accentColor: orangeAccent,
  disabledColor: Colors.grey,
  pageTransitionsTheme: _pageTransitionTheme,
);

final lightIconTheme = IconThemeData(color: orangeAccent);

final darkIconTheme = IconThemeData(color: orangeAccent);

final appBarTextTheme = TextTheme();

const _pageTransitionTheme = PageTransitionsTheme(builders: _builders);

const Map<TargetPlatform, PageTransitionsBuilder> _builders =
    <TargetPlatform, PageTransitionsBuilder>{
  TargetPlatform.android: _MaterialFadePageTransitionsBuilder(),
  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
};

class _MaterialFadePageTransitionsBuilder extends PageTransitionsBuilder {
  const _MaterialFadePageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
