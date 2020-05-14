import 'package:flutter/material.dart';

import 'package:ubisoft_club_app/widgets/waves.dart';

class ScaffoldBodyWrapper extends StatelessWidget {
  final Widget child;

  const ScaffoldBodyWrapper({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: <Widget>[
        if (child != null) ...{
          child,
        },
        Waves(
          color: theme.secondaryHeaderColor,
          height: 15.0,
        ),
      ],
    );
  }
}
