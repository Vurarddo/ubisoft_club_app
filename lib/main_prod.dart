import 'package:ubisoft_club_app/infrastructure/injector/injector.dart';
import 'package:ubisoft_club_app/main.dart';

void main() {
  configureInjection(Env.prod);

  runUbisoftClubApp();
}
