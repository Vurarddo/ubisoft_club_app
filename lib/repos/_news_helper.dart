part of 'http_news_repo_impl.dart';

class NewsType extends Equatable {
  final String value;
  static final _gameProgress = NewsType._('gameProgress');
  static final _reward = NewsType._('reward');
  static final _ubisoftGroup = NewsType._('ubisoftGroup');

  NewsType._(this.value);

  static NewsType gameProgress = _gameProgress;
  static NewsType reward = _reward;
  static NewsType ubisoftGroup = _ubisoftGroup;

  @override
  List<Object> get props => [value];
}

class _NewsHelper {
  static List<News> getNewsListFromResponse(List<Map<String, dynamic>> json) {
    return json.map((news) {
      final newsDTO = NewsDTO.fromJson(news);

      if (newsDTO.newsType == NewsType.gameProgress.value) {
        _getGameProgressNews(newsDTO);
      } else if (newsDTO.newsType == NewsType.reward.value) {
        _getRewardNews(newsDTO);
      }
      return _getUbisoftGroupNews(newsDTO);
    }).toList();
  }

  static GameProgressNews _getGameProgressNews(NewsDTO newsDTO) {
    return GameProgressNews(
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

  static RewardNews _getRewardNews(NewsDTO newsDTO) {
    return RewardNews(
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

  static UbisoftGroupNews _getUbisoftGroupNews(NewsDTO newsDTO) {
    return UbisoftGroupNews(
      id: newsDTO.id,
      liked: newsDTO.liked,
      image: newsDTO.image,
      newsTitle: newsDTO.newsTitle,
      isLiked: newsDTO.isLiked,
    );
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
