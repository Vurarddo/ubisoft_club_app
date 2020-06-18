import 'package:ubisoft_club_app/models/models.dart';

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

  @override
  Future<Map<Game, UserGameActivity>> getGames(int id) async {
    Map<Game, UserGameActivity> _games = {
      Game(
        id: 2,
        title: 'Tom Clancy\'s Rainbow Six® Siege',
        image:
            'https://3dnews.ru/assets/external/illustrations/2020/03/05/1005203/sm.1.750.jpeg',
        platform: 'XONE',
      ): UserGameActivity(
        achievements: ['1', '2'],
        lastTimeInGame: DateTime(2020, 6, 17, 16, 20),
      ),
    };
    if (id == 1) {
      _games = {
        Game(
          id: 1,
          title: 'Tom Clancy\'s Rainbow Six® Siege',
          image:
              'https://store-images.s-microsoft.com/image/apps.54674.14633508178697795.8e68c608-a2d6-4e24-862f-b89b731a3056.6c666fff-9ad2-4708-b060-60d04f504072?w=400&h=600',
          platform: 'XONE',
        ): UserGameActivity(
          achievements: ['1', '2'],
          lastTimeInGame: DateTime(2020, 6, 17, 16, 20),
        ),
        Game(
          id: 2,
          title: 'Tom Clancy\'s Rainbow Six® Siege',
          image:
              'https://store-images.s-microsoft.com/image/apps.54674.14633508178697795.8e68c608-a2d6-4e24-862f-b89b731a3056.6c666fff-9ad2-4708-b060-60d04f504072?w=400&h=600',
          platform: 'PC',
        ): UserGameActivity(
          achievements: ['1', '2'],
          lastTimeInGame: DateTime(2020, 2, 17, 16, 20),
        ),
        Game(
          id: 3,
          title: 'Far Cry® 5',
          image: 'https://cdn.shazoo.ru/203852_bSpb0BDJ4V_fc.jpg',
          platform: 'XONE',
        ): UserGameActivity(
          achievements: ['1', '2'],
          lastTimeInGame: DateTime(2020, 3, 17, 16, 20),
        ),
      };
    }

    return _games;
  }

  @override
  Future<String> getFavoriteGameImg(int id) async {
    String _image =
        'https://img5.goodfon.ru/wallpaper/nbig/9/a2/tom-clancy-s-rainbow-six-siege-rainbow-six-siege-ubisoft-ope.jpg';
    if (id == 1) {
      _image =
          'https://www.overclockers.ua/news/games/126146-Rainbow-Six-Siege-1.jpg';
    }

    return _image;
  }
}
