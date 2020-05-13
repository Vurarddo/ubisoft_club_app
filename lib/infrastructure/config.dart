import 'package:flutter/cupertino.dart';

enum Environment {
  dev,
  stage,
  prod,
}

class Config {
  final Environment environment;

  Config({
    @required this.environment,
  }) : assert(environment != null);
}
