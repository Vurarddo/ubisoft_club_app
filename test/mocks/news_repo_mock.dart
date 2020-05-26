import 'package:ubisoft_club_app/models/news/news.dart';

class NewsRepoMock implements NewsRepo {
  List<News> _news;
  final String tGameName = 'Tom Clancy\'s Rainbow Six® Siege';
  final String tPlatform = 'XONE';
  final String tTitle = 'AK-45';

  NewsRepoMock() {
    _news = [
      GameProgressNews(
        id: 1,
        liked: 100,
        gameName: tGameName,
        platform: tPlatform,
        challengeType: ChallengeType.Weekly,
        image:
            'https://le-cdn.website-editor.net/54eff58079aa4f35b86aa3de96389b31/dms3rep/multi/opt/article+logo+3-640w.png',
        progress: 50.0,
        gameMode: 'The Grand Larceny',
        isLiked: false,
        published: DateTime(2020, 26, 5, 13, 38),
      ),
      RewardNews(
        id: 2,
        liked: 200,
        gameName: tGameName,
        platform: tPlatform,
        title: tTitle,
        image:
            'https://images.gamersyde.com/image_tom_clancy_s_rainbow_six_siege-31710-2991_0002.jpg',
        rewardQuality: RewardQuality.Epic,
        isLiked: false,
        published: DateTime(2020, 25, 5, 13, 38),
      ),
      UbisoftGroupNews(
        id: 3,
        liked: 2000,
        image:
            'https://img5.goodfon.ru/wallpaper/nbig/9/a2/tom-clancy-s-rainbow-six-siege-rainbow-six-siege-ubisoft-ope.jpg',
        title: 'Operation void edge',
        isLiked: true,
        published: DateTime(2020, 25, 5, 16, 38),
      ),
      GameProgressNews(
        id: 4,
        liked: 100,
        gameName: tGameName,
        platform: tPlatform,
        challengeType: ChallengeType.Classic,
        image:
            'https://www.overclockers.ua/news/games/126146-Rainbow-Six-Siege-1.jpg',
        progress: 100.0,
        isLiked: false,
        published: DateTime(2020, 24, 5, 13, 38),
      ),
      CongratulatoryNews(
        id: 3,
        liked: 10,
        image:
            'https://cdn2.unrealengine.com/Diesel%2Fblog%2Fubisoft-games-on-sale%2FEGS_Social_UbisoftSale_1920x1080-1920x1080-442569ab89309acbbaf91c52d3c09d3b6b9454dd.jpg',
        isLiked: false,
        published: DateTime(2020, 5, 24, 16, 38),
        progressValue: 200,
        challengeType: ChallengeType.Weekly,
      ),
    ];
  }

  @override
  Future<List<News>> getNews() async {
    return _news;
  }
}
