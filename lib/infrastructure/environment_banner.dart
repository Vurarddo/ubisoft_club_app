import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:ubisoft_club_app/infrastructure/config.dart';
import 'package:ubisoft_club_app/infrastructure/injector/injector.dart';

class EnvironmentBanner extends StatelessWidget {
  final String environmentType;
  final Widget child;

  EnvironmentBanner({@required this.child})
      : assert(child != null),
        environmentType = getIt<Config>().environment;

  _BannerProps get _bannerProps {
    switch (environmentType) {
      case Env.dev:
        return _BannerProps ('DEV', Colors.green);
      case Env.stage:
        return _BannerProps ('STAGE', Colors.purple);
      default:
        return _BannerProps ('UNKNOWN', Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (environmentType == Env.prod) {
      return child;
    }

    return Banner(
      message: _bannerProps.message,
      color: _bannerProps.color,
      textDirection: TextDirection.ltr,
      layoutDirection: TextDirection.ltr,
      location: BannerLocation.topStart,
      child: child,
    );
  }
}

class _BannerProps {
  final String message;
  final Color color;

  _BannerProps(this.message, this.color);
}
