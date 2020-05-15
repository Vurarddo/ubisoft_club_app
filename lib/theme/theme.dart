import 'package:flutter/material.dart';

import 'package:ubisoft_club_app/theme/colors.dart';

enum AppTheme { light, dark }

final appThemeData = {
  AppTheme.light: lightTheme,
  AppTheme.dark: darkTheme,
};

final lightTheme = ThemeData(
  primarySwatch: orange400,
  secondaryHeaderColor: Colors.orange[400],
);

final darkTheme = ThemeData(
  primarySwatch: grey850,
  secondaryHeaderColor: Colors.grey[850],
  primaryColorDark: Colors.grey[800],
  cursorColor: Colors.grey[900],
  accentColor: Colors.grey[100],
  pageTransitionsTheme: _pageTransitionTheme,
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
