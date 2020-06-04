import 'package:flutter/material.dart';

class BackgroundWithImage extends StatelessWidget {
  final String image;
  final Widget child;

  const BackgroundWithImage({
    Key key,
    @required this.image,
    @required this.child,
  })  : assert(image != null),
        assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: <Widget>[
        Container(
          height: 200,
          margin: EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: NetworkImage(image),
            ),
          ),
        ),
        Container(
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [theme.dividerColor, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.18, .6],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 125.0),
          child: child,
        ),
      ],
    );
  }
}
