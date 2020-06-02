import 'package:ubisoft_club_app/models/user/user.dart';

class HttpUserRepoImpl implements UserRepo {
  @override
  Future<User> getUserById(int id) {
    // TODO: implement getProfileById
    throw UnimplementedError();
  }
}

// TODO: drop it!!!
class UserRepoMock implements UserRepo {
  List<User> _users = [
    User.user(
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
    ),
    User.user(
      id: 3,
      clubName: 'Vitaliysc7',
      platformName: 'VitoFromEarth',
      image:
          'https://cdn.pixabay.com/photo/2015/05/01/10/32/seagull-748201_960_720.jpg',
      lvl: 40,
      clubUnits: 15,
      registerDate: DateTime(2016, 6, 18),
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
    ),
  ];

  @override
  Future<User> getUserById(int id) async {
    final user = _users.firstWhere((p) => p.id == id);

    return user;
  }
}
