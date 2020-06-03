import 'package:ubisoft_club_app/models/user/user.dart';

class HttpUserRepoImpl implements UserRepo {
// TODO: drop it!!!
  List<User> _users = [
    User.user(
      id: 1,
      clubName: 'VurKun',
      platformName: 'VladOS8297',
      image:
          'https://assets.jpegmini.com/user/images/slider_puffin_jpegmini_mobile.jpg',
      clubLevel: ClubLevel(
        level: 30,
        levelProgress: 330.5,
        maxLevelProgress: 1000.0,
      ),
      clubUnits: 15,
      registerDate: DateTime(2017, 4, 12),
      statistics: [
        UserStatistic(
          achievementAmount: 41,
          achievementTitle: 'Завершено испытаний «Классика»',
        ),
        UserStatistic(
          achievementAmount: 35,
          achievementTitle: 'Получено наград',
        ),
        UserStatistic(
          achievementAmount: 305,
          achievementTitle: 'Заработано Units',
        ),
        UserStatistic(
          achievementAmount: 8,
          achievementTitle: 'Разблокировано значков',
        ),
        UserStatistic(
          achievementAmount: 18,
          achievementTitle: 'Some Achievement 5',
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
      clubLevel: ClubLevel(
        level: 30,
      ),
      registerDate: DateTime(2016, 6, 18),
      statistics: [
        UserStatistic(
          achievementAmount: 56,
          achievementTitle: 'Завершено испытаний «Классика»',
        ),
        UserStatistic(
          achievementAmount: 44,
          achievementTitle: 'Получено наград',
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

  @override
  Future<User> getFullUser(User user) async {
    final userWithDetails = await getUserById(user.id);

    return User.mergeInfFull(userWithDetails, user);
  }
}
