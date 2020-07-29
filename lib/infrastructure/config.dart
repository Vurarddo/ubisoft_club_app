import 'package:flutter/foundation.dart';

class Config {
  final String environment;

  Config({
    @required this.environment,
  }) : assert(environment != null);
}
