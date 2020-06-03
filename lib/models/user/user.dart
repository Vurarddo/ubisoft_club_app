import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:ubisoft_club_app/infrastructure/injector.dart';

abstract class UserRepo {
  Future<User> getUserById(int id);

  Future<User> getFullUser(User user);
}

enum UserType { profile, clubAndNews }

class UserFactory {
  final UserRepo _userRepo;

  Future<User> getUserById(int id) {
    return _userRepo.getUserById(id);
  }

  Future<User> getFullUser(User user) async {
    return _userRepo.getFullUser(user);
  }

  UserFactory() : _userRepo = injector.get<UserRepo>();
}

class User extends Equatable {
  final int id;
  final String clubName;
  final String platformName;
  final String image;
  final ClubLevel clubLevel;
  final int clubUnits;
  final DateTime registerDate;
  final List<UserStatistic> statistics;
  final List<Game> games;
  final Game favoriteGame;
  final UserType accountType;

  User._({
    this.id,
    this.clubName,
    this.platformName,
    this.image,
    this.clubLevel,
    this.clubUnits,
    this.registerDate,
    this.statistics,
    this.games,
    this.favoriteGame,
    this.accountType,
  });

  factory User.mergeInfFull(User source, User user) {
    return User._(
      id: source.id ?? user.id,
      clubName: source.clubName ?? user.clubName,
      platformName: source.platformName ?? user.platformName,
      image: source.image ?? user.image,
      clubLevel: source.clubLevel ?? user.clubLevel,
      clubUnits: source.clubUnits ?? user.clubUnits,
      registerDate: source.registerDate ?? user.registerDate,
      statistics: source.statistics ?? user.statistics,
      games: source.games ?? user.games,
      favoriteGame: source.favoriteGame ?? user.favoriteGame,
      accountType: user.accountType,
    );
  }

  factory User.user({
    @required int id,
    @required String clubName,
    @required String platformName,
    @required String image,
    @required ClubLevel clubLevel,
    @required DateTime registerDate,
    @required List<UserStatistic> statistics,
    @required List<Game> games,
    @required Game favoriteGame,
    int clubUnits,
  }) {
    return User._(
      id: id,
      clubName: clubName,
      platformName: platformName,
      image: image,
      clubLevel: clubLevel,
      registerDate: registerDate,
      statistics: statistics,
      games: games,
      favoriteGame: favoriteGame,
      clubUnits: clubUnits,
      accountType: UserType.profile,
    );
  }

  factory User.clubAndNews({
    @required int id,
    @required String name,
    @required String image,
  }) {
    return User._(
      id: id,
      clubName: name,
      image: image,
      accountType: UserType.clubAndNews,
    );
  }

  double getParsedLevelProgress() {
    final levelProgressPercent =
        (clubLevel.levelProgress * 100) / clubLevel.maxLevelProgress;
    return levelProgressPercent / 100;
  }

  int getYearsInClub() {
    return DateTime.now().year - registerDate.year;
  }

  @override
  List<Object> get props => [
        id,
        clubName,
        platformName,
        image,
        clubLevel,
        clubUnits,
        registerDate,
        statistics,
        games,
        favoriteGame,
      ];
}

class ClubLevel extends Equatable {
  final int level;
  final double levelProgress;
  final double maxLevelProgress;

  ClubLevel({
    @required this.level,
    this.levelProgress,
    this.maxLevelProgress,
  });

  @override
  List<Object> get props => [
        level,
        levelProgress,
        maxLevelProgress,
      ];
}

class UserStatistic extends Equatable {
  final int achievementAmount;
  final String achievementTitle;

  UserStatistic({
    @required this.achievementAmount,
    @required this.achievementTitle,
  })  : assert(achievementAmount != null),
        assert(achievementTitle != null);

  @override
  List<Object> get props => [achievementAmount, achievementTitle];
}

class Game extends Equatable {
  final int id;
  final String title;
  final String image;
  final String platform;

  Game({
    @required this.id,
    @required this.title,
    @required this.image,
    @required this.platform,
  })  : assert(id != null),
        assert(title != null),
        assert(image != null),
        assert(platform != null);

  @override
  List<Object> get props => [
        id,
        title,
        image,
        platform,
      ];
}
