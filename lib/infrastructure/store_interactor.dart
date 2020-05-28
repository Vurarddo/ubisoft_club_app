import 'package:ubisoft_club_app/models/profile/profile.dart';

class StoreInteractor {
  // TODO: refactor this after adding login
  Future<Profile> getProfile() async {
    final _profile = Profile.user(
      id: 1,
      clubName: 'VurKun',
      platformName: 'VladOS8297',
      image:
          'https://assets.jpegmini.com/user/images/slider_puffin_jpegmini_mobile.jpg',
      lvl: 30,
      clubUnits: 15,
      registerDate: DateTime(2017, 4, 12),
      statistic: [
        UserStatistic(
          achievementAmount: 41,
          achievementTitle: 'Some Achievement',
        ),
      ],
      games: [
        Game(
          id: 2,
          title: 'Tom Clancy\'s Rainbow Six® Siege',
          image:
              'https://3dnews.ru/assets/external/illustrations/2020/03/05/1005203/sm.1.750.jpeg',
          platform: 'XONE',
        ),
      ],
      favoriteGame: Game(
        id: 2,
        title: 'Tom Clancy\'s Rainbow Six® Siege',
        image:
            'https://www.overclockers.ua/news/games/126146-Rainbow-Six-Siege-1.jpg',
        platform: 'XONE',
      ),
    );

    return _profile;
  }
}
