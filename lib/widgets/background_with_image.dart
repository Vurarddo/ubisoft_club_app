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
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        Container(
          height: 200,
          margin: EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
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
              stops: [0.17, .7],
            ),
          ),
        ),
        child,
      ],
    );
  }
}