import 'package:ubisoft_club_app/models/profile/profile.dart';

class HttpProfileRepoImpl implements ProfileRepo {
  @override
  Future<Profile> getProfileById(int id) {
    // TODO: implement getProfileById
    throw UnimplementedError();
  }
}

// TODO: drop it!!!
class ProfileRepoMock implements ProfileRepo {
  Profile _profile = Profile.user(
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

  @override
  Future<Profile> getProfileById(int id) async {
    return _profile;
  }
}
