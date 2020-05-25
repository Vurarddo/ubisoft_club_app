part of 'http_news_repo_impl.dart';

class _NewsHelper {
  static List<News> getNewsListFromResponse(List<Map<String, dynamic>> json) {
    return json.map((news) {
      final newsDTO = NewsDTO.fromJson(news);
      final _type = {
        NewsType.GameProgress: 'gameProgress',
        NewsType.Reward: 'reward',
        NewsType.Company: 'company',
      };

      if (newsDTO.newsType == _type.values.first) {
        _getGameProgressNews(newsDTO);
      } else if (newsDTO.newsType == _type.values.last) {
        _getCompanyNews(newsDTO);
      }
      return _getRewardNews(newsDTO);
    }).toList();
  }

  static News _getGameProgressNews(NewsDTO newsDTO) {
    return News.gameProgress(
      id: newsDTO.id,
      liked: newsDTO.liked,
      gameName: newsDTO.gameName,
      platform: newsDTO.platform,
      challengeType: newsDTO.challengeType,
      progress: newsDTO.progress,
      image: newsDTO.image,
      gameMode: newsDTO?.gameMode ?? '',
      isLiked: newsDTO.isLiked,
    );
  }

  static News _getCompanyNews(NewsDTO newsDTO) {
    return News.company(
      id: newsDTO.id,
      liked: newsDTO.liked,
      image: newsDTO.image,
      newsTitle: newsDTO.newsTitle,
      isLiked: newsDTO.isLiked,
    );
  }

  static News _getRewardNews(NewsDTO newsDTO) {
    return News.reward(
      id: newsDTO.id,
      liked: newsDTO.liked,
      gameName: newsDTO.gameName,
      platform: newsDTO.platform,
      rewardType: newsDTO.rewardType,
      image: newsDTO.image,
      isLiked: newsDTO.isLiked,
    );
  }
}
