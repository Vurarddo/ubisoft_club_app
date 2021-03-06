import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:ubisoft_club_app/infrastructure/injector.dart';
import 'package:ubisoft_club_app/models/user/user.dart';

abstract class NewsRepo {
  Future<List<News>> getNews();
}

enum NewsTypeEnum { gameProgress, reward, club, congratulatory }

enum ChallengeType { weekly, classic }

enum RewardQuality { legendary, epic, rare, common, exotic }

class NewsFactory {
  final NewsRepo _newsRepo;

  Future<List<News>> getNews() async {
    return _newsRepo.getNews();
  }

  NewsFactory() : _newsRepo = injector.get<NewsRepo>();
}

abstract class News extends Equatable {
  final _newsRepo = injector.get<NewsRepo>();
  final int id;
  final User user;
  final int liked;
  final String image;
  final bool isLiked;
  final DateTime published;
  final NewsTypeEnum newsType;

  News({
    @required this.id,
    @required this.user,
    @required this.liked,
    @required this.image,
    @required this.isLiked,
    @required this.published,
    @required this.newsType,
  })  : assert(id != null),
        assert(user != null),
        assert(liked != null),
        assert(image != null),
        assert(isLiked != null),
        assert(published != null),
        assert(newsType != null);

  Future<List<News>> getNews() async {
    return _newsRepo.getNews();
  }
}

class GameProgressNews extends News {
  final String gameName;
  final String platform;
  final ChallengeType challengeType;
  final String gameMode;
  final double progress;

  GameProgressNews({
    @required int id,
    @required User user,
    @required int liked,
    @required String image,
    @required bool isLiked,
    @required DateTime published,
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
          user: user,
          liked: liked,
          image: image,
          isLiked: isLiked,
          published: published,
          newsType: NewsTypeEnum.gameProgress,
        );

  @override
  List<Object> get props => [
        id,
        user,
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
  final String title;
  final RewardQuality rewardQuality;

  RewardNews({
    @required int id,
    @required User user,
    @required int liked,
    @required String image,
    @required bool isLiked,
    @required DateTime published,
    @required this.gameName,
    @required this.platform,
    @required this.title,
    @required this.rewardQuality,
  })  : assert(gameName != null),
        assert(platform != null),
        assert(title != null),
        assert(rewardQuality != null),
        super(
          id: id,
          user: user,
          liked: liked,
          image: image,
          isLiked: isLiked,
          published: published,
          newsType: NewsTypeEnum.reward,
        );

  @override
  List<Object> get props => [
        id,
        user,
        liked,
        image,
        isLiked,
        published,
        gameName,
        platform,
        title,
        rewardQuality,
      ];
}

class ClubNews extends News {
  final String title;

  ClubNews({
    @required int id,
    @required User user,
    @required int liked,
    @required String image,
    @required bool isLiked,
    @required DateTime published,
    @required this.title,
  })  : assert(title != null),
        super(
          id: id,
          user: user,
          liked: liked,
          image: image,
          isLiked: isLiked,
          published: published,
          newsType: NewsTypeEnum.club,
        );

  @override
  List<Object> get props => [
        id,
        user,
        liked,
        image,
        isLiked,
        published,
        title,
      ];
}

class CongratulatoryNews extends News {
  final int progressValue;
  final ChallengeType challengeType;

  CongratulatoryNews({
    @required int id,
    @required User user,
    @required int liked,
    @required String image,
    @required bool isLiked,
    @required DateTime published,
    @required this.progressValue,
    @required this.challengeType,
  })  : assert(progressValue != null),
        assert(challengeType != null),
        super(
          id: id,
          user: user,
          liked: liked,
          image: image,
          isLiked: isLiked,
          published: published,
          newsType: NewsTypeEnum.congratulatory,
        );

  @override
  List<Object> get props => [
        id,
        user,
        liked,
        image,
        isLiked,
        published,
        progressValue,
        challengeType,
      ];
}
