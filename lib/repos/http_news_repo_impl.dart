import 'package:ubisoft_club_app/models/news/news.dart';
import 'package:ubisoft_club_app/repos/news_dto/news_dto.dart';

part '_news_helper.dart';

class HttpNewsRepoImpl implements NewsRepo {
  @override
  Future<List<News>> getNews() async {
    return null;
  }
}

// TODO: drop it
class NewsRepoMock implements NewsRepo {
  List<News> _news;
  final String tGameName = 'Tom Clancy\'s Rainbow Six® Siege';
  final String tPlatform = 'XONE';

  NewsRepoMock() {
    _news = [
      News.gameProgress(
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
      ),
      News.reward(
        id: 2,
        liked: 200,
        gameName: tGameName,
        platform: tPlatform,
        image:
            'https://images.gamersyde.com/image_tom_clancy_s_rainbow_six_siege-31710-2991_0002.jpg',
        rewardType: 'epic',
        isLiked: false,
      ),
      News.company(
        id: 3,
        liked: 2000,
        image:
            'https://img5.goodfon.ru/wallpaper/nbig/9/a2/tom-clancy-s-rainbow-six-siege-rainbow-six-siege-ubisoft-ope.jpg',
        newsTitle: 'Operation void edge',
        isLiked: true,
      ),
      News.gameProgress(
        id: 4,
        liked: 100,
        gameName: tGameName,
        platform: tPlatform,
        challengeType: ChallengeType.Classic,
        image:
            'https://www.overclockers.ua/news/games/126146-Rainbow-Six-Siege-1.jpg',
        progress: 100.0,
        isLiked: false,
      ),
    ];
  }

  @override
  Future<List<News>> getNews() async {
    return _news;
  }
}
