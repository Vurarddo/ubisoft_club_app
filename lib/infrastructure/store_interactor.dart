import 'package:ubisoft_club_app/models/models.dart';

class StoreInteractor {
  // TODO: refactor this after adding login
  Future<User> getUser() async {
    final _user = User.user(
      id: 1,
      clubName: 'VurKun',
      platformName: 'VladOS8297',
      image:
          'https://assets.jpegmini.com/user/images/slider_puffin_jpegmini_mobile.jpg',
      clubLevel: ClubLevel(
        level: 30,
        levelProgress: 370.1,
        maxLevelProgress: 1000.0,
      ),
      clubUnits: 15,
      registerDate: DateTime(2017, 4, 12),
      statistics: [
        UserStatistic(
          achievementAmount: 41,
          achievementTitle: 'Some Achievement',
        ),
      ],
    );

    return _user;
  }
}
