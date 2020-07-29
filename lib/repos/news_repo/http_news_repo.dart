import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:ubisoft_club_app/models/news.dart';
import 'package:ubisoft_club_app/models/user/user.dart';

part '_news_helper.dart';

@Singleton(as: INewsRepo)
class HttpNewsRepo implements INewsRepo {
// TODO: drop it
  static String tGameName = 'Tom Clancy\'s Rainbow Six® Siege';
  static String tPlatform = 'XONE';

  final _news = [
    GameProgressNews(
      id: 1,
      user: User.clubAndNews(
        id: 1,
        name: 'VurKun',
        image:
            'https://assets.jpegmini.com/user/images/slider_puffin_jpegmini_mobile.jpg',
      ),
      liked: 100,
      gameName: tGameName,
      platform: tPlatform,
      challengeType: ChallengeType.weekly,
      image:
          'https://le-cdn.website-editor.net/54eff58079aa4f35b86aa3de96389b31/dms3rep/multi/opt/article+logo+3-640w.png',
      progress: 50.0,
      gameMode: 'The Grand Larceny',
      isLiked: false,
      published: DateTime(2020, 5, 26, 14, 05),
    ),
    ClubNews(
      id: 2,
      user: User.clubAndNews(
        id: 2,
        name: 'Tom Clancy\'s Rainbow Six® Siege',
        image:
            'https://3dnews.ru/assets/external/illustrations/2020/03/05/1005203/sm.1.750.jpeg',
      ),
      liked: 2000,
      image:
          'https://img5.goodfon.ru/wallpaper/nbig/9/a2/tom-clancy-s-rainbow-six-siege-rainbow-six-siege-ubisoft-ope.jpg',
      title: 'Operation void edge',
      isLiked: true,
      published: DateTime(2020, 5, 24, 16, 38),
    ),
    GameProgressNews(
      id: 3,
      user: User.clubAndNews(
        id: 3,
        name: 'Vitaliysc7',
        image:
            'https://cdn.pixabay.com/photo/2015/05/01/10/32/seagull-748201_960_720.jpg',
      ),
      liked: 100,
      gameName: tGameName,
      platform: tPlatform,
      challengeType: ChallengeType.classic,
      image:
          'https://www.overclockers.ua/news/games/126146-Rainbow-Six-Siege-1.jpg',
      progress: 100.0,
      isLiked: false,
      published: DateTime(2020, 4, 5, 13, 38),
    ),
    RewardNews(
      id: 4,
      user: User.clubAndNews(
        id: 1,
        name: 'VurKun',
        image:
            'https://assets.jpegmini.com/user/images/slider_puffin_jpegmini_mobile.jpg',
      ),
      liked: 200,
      gameName: tGameName,
      platform: tPlatform,
      title: 'Weapons',
      image: 'https://i.imgur.com/WbVZoUG.jpg',
      rewardQuality: RewardQuality.epic,
      isLiked: false,
      published: DateTime(2020, 5, 25, 13, 38),
    ),
    CongratulatoryNews(
      id: 5,
      user: User.clubAndNews(
        id: 1,
        name: 'VurKun',
        image:
            'https://assets.jpegmini.com/user/images/slider_puffin_jpegmini_mobile.jpg',
      ),
      liked: 10,
      image:
          'https://cdn2.unrealengine.com/Diesel%2Fblog%2Fubisoft-games-on-sale%2FEGS_Social_UbisoftSale_1920x1080-1920x1080-442569ab89309acbbaf91c52d3c09d3b6b9454dd.jpg',
      isLiked: false,
      published: DateTime(2020, 5, 24, 16, 38),
      progressValue: 200,
      challengeType: ChallengeType.weekly,
    ),
  ];

  // @factoryMethod
  // static Future<HttpNewsRepo> init() async => HttpNewsRepo();

  @override
  Future<List<News>> getNews() async {
    return _news;
  }
}
