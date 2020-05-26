import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class NewsRepo {
  Future<List<News>> getNews();
}

enum NewsTypeEnum {
  GameProgress,
  Reward,
  UbisoftGroup,
}

enum ChallengeType {
  Weekly,
  Classic,
}

enum RewardQuality {
  Legendary,
  Epic,
  Rare,
  Common,
  Exotic,
}

abstract class News extends Equatable {
  final int id;
  final int liked;
  final String image;
  final bool isLiked;
  final DateTime published;
  final NewsTypeEnum newsType;

  News({
    @required this.id,
    @required this.liked,
    @required this.image,
    @required this.isLiked,
    @required this.published,
    @required this.newsType,
  })  : assert(id != null),
        assert(liked != null),
        assert(image != null),
        assert(isLiked != null),
        assert(published != null),
        assert(newsType != null);
}

class GameProgressNews extends News {
  final String gameName;
  final String platform;
  final ChallengeType challengeType;
  final String gameMode;
  final double progress;

  GameProgressNews({
    int id,
    int liked,
    String image,
    bool isLiked,
    DateTime published,
    @required this.gameName,
    @required this.platform,
    @required this.challengeType,
    @required this.progress,
    this.gameMode,
  })  : assert(gameName != null),
        assert(platform != null),
        assert(challengeType != null),
        assert(progress != null),
        super(
          id: id,
          liked: liked,
          image: image,
          isLiked: isLiked,
          published: published,
          newsType: NewsTypeEnum.GameProgress,
        );

  @override
  List<Object> get props => [
        id,
        liked,
        image,
        isLiked,
        published,
        gameName,
        platform,
        challengeType,
        progress,
        gameMode,
      ];
}

class RewardNews extends News {
  final String gameName;
  final String platform;
  final RewardQuality rewardQuality;

  RewardNews({
    int id,
    int liked,
    String image,
    bool isLiked,
    DateTime published,
    @required this.gameName,
    @required this.platform,
    @required this.rewardQuality,
  })  : assert(gameName != null),
        assert(platform != null),
        assert(rewardQuality != null),
        super(
          id: id,
          liked: liked,
          image: image,
          isLiked: isLiked,
          published: published,
          newsType: NewsTypeEnum.Reward,
        );

  @override
  List<Object> get props => [
        id,
        liked,
        image,
        isLiked,
        published,
        gameName,
        platform,
        rewardQuality,
      ];
}

class UbisoftGroupNews extends News {
  final String newsTitle;

  UbisoftGroupNews({
    int id,
    int liked,
    String image,
    bool isLiked,
    DateTime published,
    @required this.newsTitle,
  })  : assert(newsTitle != null),
        super(
          id: id,
          liked: liked,
          image: image,
          isLiked: isLiked,
          published: published,
          newsType: NewsTypeEnum.UbisoftGroup,
        );

  @override
  List<Object> get props => [
        id,
        liked,
        image,
        isLiked,
        published,
        newsTitle,
      ];
}
