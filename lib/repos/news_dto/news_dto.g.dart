// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDTO _$NewsDTOFromJson(Map<String, dynamic> json) {
  return NewsDTO(
    id: json['id'] as int,
    liked: json['liked'] as int,
    gameName: json['gameName'] as String,
    platform: json['platform'] as String,
    challengeType: json['challengeType'] as String,
    gameMode: json['gameMode'] as String,
    rewardQuality: json['rewardQuality'] as String,
    newsTitle: json['newsTitle'] as String,
    image: json['image'] as String,
    progress: (json['progress'] as num)?.toDouble(),
    isLiked: json['isLiked'] as bool,
    newsType: json['newsType'] as String,
  );
}
