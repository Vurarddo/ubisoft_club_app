import 'package:ubisoft_club_app/infrastructure/config.dart';
import 'package:ubisoft_club_app/infrastructure/injector.dart';
import 'package:ubisoft_club_app/main.dart';

void main() {
  injector..register<Config>(Config(environment: Environment.stage));

  runUbisoftClubApp();
}
