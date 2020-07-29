import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:ubisoft_club_app/infrastructure/config.dart';
import 'package:ubisoft_club_app/infrastructure/injector/injector.config.dart';

final getIt = GetIt.instance;

@injectableInit
void configureInjection(String environment) {
  getIt.registerSingleton<Config>(Config(environment: environment));
  $initGetIt(getIt, environment: environment);
}

abstract class Env {
  static const dev = 'dev';
  static const stage = 'stage';
  static const prod = 'prod';
}
