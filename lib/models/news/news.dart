import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class NewsRepo {
  Future<List<News>> getNews();
}

enum NewsType {
  GameProgress,
  Reward,
  Company,
}

class News extends Equatable {
  final int id;
  final int liked;
  final String gameName;
  final String platform;
  final String challengeType;
  final String gameMode;
  final String rewardType;
  final String newsTitle;
  final String image;
  final double progress;
  final bool isLiked;
  final NewsType newsType;

  News._({
    this.id,
    this.liked,
    this.gameName,
    this.platform,
    this.challengeType,
    this.gameMode,
    this.rewardType,
    this.newsTitle,
    this.image,
    this.progress,
    this.isLiked,
    this.newsType,
  });

  factory News.gameProgress({
    @required int id,
    @required int liked,
    @required String gameName,
    @required String platform,
    @required String challengeType,
    @required String image,
    @required double progress,
    @required bool isLiked,
    String gameMode,
  }) {
    return News._(
      id: id,
      liked: liked,
      gameName: gameName,
      platform: platform,
      challengeType: challengeType,
      image: image,
      progress: progress,
      isLiked: isLiked,
      gameMode: gameMode,
      newsType: NewsType.GameProgress,
    );
  }

  factory News.reward({
    @required int id,
    @required int liked,
    @required String gameName,
    @required String platform,
    @required String rewardType,
    @required String image,
    @required bool isLiked,
  }) {
    return News._(
      id: id,
      liked: liked,
      gameName: gameName,
      platform: platform,
      rewardType: rewardType,
      image: image,
      isLiked: isLiked,
      newsType: NewsType.Reward,
    );
  }

  factory News.company({
    @required int id,
    @required int liked,
    @required String image,
    @required String newsTitle,
    @required bool isLiked,
  }) {
    return News._(
      id: id,
      liked: liked,
      image: image,
      newsTitle: newsTitle,
      isLiked: isLiked,
      newsType: NewsType.Company,
    );
  }

  @override
  List<Object> get props => [
        id,
        liked,
        gameName,
        platform,
        challengeType,
        gameMode,
        rewardType,
        newsTitle,
        image,
        progress,
        isLiked,
        newsType,
      ];
}
