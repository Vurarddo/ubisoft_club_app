part of 'http_news_repo_impl.dart';

class _NewsHelper {
  static const _newsType = {
    NewsType.GameProgress: 'gameProgress',
    NewsType.Reward: 'reward',
    NewsType.Company: 'company',
  };

  static List<News> getNewsListFromResponse(List<Map<String, dynamic>> json) {
    return json.map((news) {
      final newsDTO = NewsDTO.fromJson(news);

      if (newsDTO.newsType == _newsType.values.first) {
        _getGameProgressNews(newsDTO);
      } else if (newsDTO.newsType == _newsType.values.last) {
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
      challengeType: _getChallengeType(newsDTO),
      progress: newsDTO.progress,
      image: newsDTO.image,
      gameMode: newsDTO.gameMode,
      isLiked: newsDTO.isLiked,
    );
  }

  static ChallengeType _getChallengeType(NewsDTO newsDTO) {
    switch (newsDTO.challengeType) {
      case _TypeOfChallenge.weekly:
        return ChallengeType.Weekly;
      case _TypeOfChallenge.classic:
        return ChallengeType.Classic;
      default:
        return null;
    }
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
      rewardQuality: _getRewardQuality(newsDTO),
      image: newsDTO.image,
      isLiked: newsDTO.isLiked,
    );
  }

  static RewardQuality _getRewardQuality(NewsDTO newsDTO) {
    switch (newsDTO.challengeType) {
      case _RewardQuality.legendary:
        return RewardQuality.Legendary;
      case _RewardQuality.epic:
        return RewardQuality.Epic;
      case _RewardQuality.rare:
        return RewardQuality.Rare;
      case _RewardQuality.common:
        return RewardQuality.Common;
      case _RewardQuality.exotic:
        return RewardQuality.Exotic;
      default:
        return null;
    }
  }
}

class _TypeOfChallenge {
  static const String weekly = 'weekly';
  static const String classic = 'classic';
}

class _RewardQuality {
  static const String legendary = 'legendary';
  static const String epic = 'epic';
  static const String rare = 'rare';
  static const String common = 'common';
  static const String exotic = 'exotic';
}
