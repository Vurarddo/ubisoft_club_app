import 'package:ubisoft_club_app/models/news/news.dart';

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
        challengeType: ChallengeType.Classic,
        image:
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.overclockers.ua%2Fnews%2Fgames%2F2020-01-28%2F126146%2F&psig=AOvVaw05RM2CDnh9huJZIbWUG68H&ust=1590244415682000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKiQ3qHYx-kCFQAAAAAdAAAAABAD',
        progress: 50.0,
        gameMode: 'The Grand Larceny',
        isLiked: false,
      ),
      News.reward(
        id: 2,
        liked: 200,
        gameName: tGameName,
        platform: tPlatform,
        image: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.reddit.com%2Fr%2FRainbow6%2Fcomments%2F7vrddo%2Flions_main_weapon_credit_umisternicex%2F&psig=AOvVaw0Mx5OSO1Rdo01wXr0p9-Wz&ust=1590245831007000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLjg4sjdx-kCFQAAAAAdAAAAABAD',
        rewardQuality: RewardQuality.Legendary,
        isLiked: false,
      ),
      News.company(
        id: 3,
        liked: 2000,
        image: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Frainbowsix.fandom.com%2Fru%2Fwiki%2FVoid_Edge&psig=AOvVaw3IgnJ0SFm640WrDUaxFhMD&ust=1590245976017000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCJif14fex-kCFQAAAAAdAAAAABAD',
        newsTitle: 'Operation void edge',
        isLiked: true,
      ),
    ];
  }

  @override
  Future<List<News>> getNews() async {
    return _news;
  }
}
