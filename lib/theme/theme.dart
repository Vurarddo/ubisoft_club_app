import 'package:flutter/material.dart';

import 'package:ubisoft_club_app/theme/colors.dart';

enum AppTheme { light, dark }

final appThemeData = {
  AppTheme.light: lightTheme,
  AppTheme.dark: darkTheme,
};

final lightTheme = ThemeData(
  primarySwatch: orangeAccent,
  appBarTheme: lightAppBarTheme,
  pageTransitionsTheme: _pageTransitionTheme,
  iconTheme: lightIconTheme,
  textTheme: lightTextTheme,
  scaffoldBackgroundColor: Colors.grey[300],
  secondaryHeaderColor: orangeAccent,
  bottomAppBarColor: Colors.white,
  accentColor: orangeAccent,
  disabledColor: Colors.grey,
  cardColor: Colors.white,
  dividerColor: Colors.grey[300],
  primaryColorLight: Colors.grey,
  unselectedWidgetColor: lightGreyColor,
);

final darkTheme = ThemeData(
  primarySwatch: grey850,
  appBarTheme: darkAppBarTheme,
  iconTheme: darkIconTheme,
  textTheme: darkTextTheme,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Colors.grey[300],
  ),
  pageTransitionsTheme: _pageTransitionTheme,
  scaffoldBackgroundColor: Colors.grey[800],
  secondaryHeaderColor: Colors.grey[850],
  bottomAppBarColor: Colors.grey[850],
  accentColor: orangeAccent,
  disabledColor: Colors.grey,
  cardColor: Colors.grey[700],
  dividerColor: Colors.grey[800],
  primaryColorLight: Colors.white70,
  unselectedWidgetColor: backgroundGreyColor,
);

final lightIconTheme = IconThemeData(color: Colors.white);

final darkIconTheme = IconThemeData(color: orangeAccent);

final lightAppBarTheme = AppBarTheme(
  elevation: 0,
  iconTheme: lightIconTheme,
);

final darkAppBarTheme = AppBarTheme(
  elevation: 0,
  iconTheme: darkIconTheme,
  textTheme: TextTheme(
    headline6: TextStyle(
      color: orangeAccent,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
);

final lightTextTheme = TextTheme(
  overline: TextStyle(color: Colors.white),
  headline4: TextStyle(color: Colors.black),
  headline6: TextStyle(color: Colors.black),
);

final darkTextTheme = TextTheme(
  bodyText1: TextStyle(color: Colors.white70),
  bodyText2: TextStyle(color: Colors.white70),
  subtitle1: TextStyle(color: Colors.white70),
  caption: TextStyle(color: Colors.white54),
  overline: TextStyle(color: orangeAccent),
  headline4: TextStyle(color: Colors.white70),
  headline6: TextStyle(color: Colors.white70),
);

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
