import 'package:json_annotation/json_annotation.dart';

part 'news_dto.g.dart';

@JsonSerializable()
class NewsDTO {
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
  final String newsType;

  NewsDTO({
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

  factory NewsDTO.fromJson(Map<String, dynamic> json) =>
      _$NewsDTOFromJson(json);
}
