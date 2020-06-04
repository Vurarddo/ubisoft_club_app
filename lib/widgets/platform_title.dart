import 'package:flutter/material.dart';

class PlatformTitle extends StatelessWidget {
  final String platform;

  const PlatformTitle({
    Key key,
    @required this.platform,
  })  : assert(platform != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.only(left: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
          border: Border.all(color: theme.textTheme.subtitle1.color),
          borderRadius: BorderRadius.circular(4.0)),
      child: Text(
        platform,
        style: theme.textTheme.caption.copyWith(
          color: theme.textTheme.subtitle1.color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
