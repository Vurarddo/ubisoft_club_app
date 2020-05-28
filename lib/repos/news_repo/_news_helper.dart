part of 'http_news_repo_impl.dart';

class NewsType extends Equatable {
  final String value;
  static final _gameProgress = NewsType._('gameProgress');
  static final _reward = NewsType._('reward');
  static final _ubisoftGroup = NewsType._('ubisoftGroup');
  static final _congratulatory = NewsType._('congratulatory');

  NewsType._(this.value);

  static NewsType gameProgress = _gameProgress;
  static NewsType reward = _reward;
  static NewsType ubisoftGroup = _ubisoftGroup;
  static NewsType congratulatory = _congratulatory;

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
        return ChallengeType.weekly;
      case _TypeOfChallenge.classic:
        return ChallengeType.classic;
      default:
        return null;
    }
  }

  static RewardNews _getRewardNews(NewsDTO newsDTO) {
    // TODO !!!!!!
    return RewardNews(
      id: newsDTO.id,
      liked: newsDTO.liked,
      gameName: newsDTO.gameName,
      platform: newsDTO.platform,
      rewardQuality: _getRewardQuality(newsDTO),
      image: newsDTO.image,
      isLiked: newsDTO.isLiked,
      title: '',
      published: DateTime.now(),
    );
  }

  static RewardQuality _getRewardQuality(NewsDTO newsDTO) {
    switch (newsDTO.challengeType) {
      case _RewardQuality.legendary:
        return RewardQuality.legendary;
      case _RewardQuality.epic:
        return RewardQuality.epic;
      case _RewardQuality.rare:
        return RewardQuality.rare;
      case _RewardQuality.common:
        return RewardQuality.common;
      case _RewardQuality.exotic:
        return RewardQuality.exotic;
      default:
        return null;
    }
  }

  static ClubNews _getUbisoftGroupNews(NewsDTO newsDTO) {
    return ClubNews(
      id: newsDTO.id,
      liked: newsDTO.liked,
      image: newsDTO.image,
      title: newsDTO.newsTitle,
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
