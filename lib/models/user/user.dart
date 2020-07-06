import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:ubisoft_club_app/infrastructure/injector.dart';
import 'package:ubisoft_club_app/models/models.dart';

abstract class UserRepo {
  Future<User> getUserById(int id);

  Future<User> getFullUser(User user);

  Future<Map<Game, UserGameActivity>> getGames(int id);

  Future<String> getFavoriteGameImg(int id);
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

  List<String> getPlatforms(List<Game> games) {
    return games.map((game) => game.platform).toSet().toList();
  }

  UserFactory() : _userRepo = injector.get<UserRepo>();
}

class User extends Equatable {
  final UserRepo _userRepo = injector.get<UserRepo>();
  final int id;
  final String clubName;
  final String platformName;
  final String image;
  final ClubLevel clubLevel;
  final int clubUnits;
  final DateTime registerDate;
  final List<UserStatistic> statistics;
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
    this.accountType,
  });

  Future<Map<Game, UserGameActivity>> getGames() async {
    return _userRepo.getGames(id);
  }

  Future<String> getFavoriteGameImg() {
    return injector.get<UserRepo>().getFavoriteGameImg(id);
  }

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

class UserGameActivity extends Equatable {
  final DateTime lastTimeInGame;
  final List<Achievement> achievements;

  UserGameActivity({
    @required this.lastTimeInGame,
    @required this.achievements,
  })  : assert(lastTimeInGame != null),
        assert(achievements != null);

  @override
  List<Object> get props => [lastTimeInGame, achievements];
}

class Achievement extends Equatable {
  final int currentProgress;
  final int maxProgress;

  Achievement({
    @required this.maxProgress,
    @required this.currentProgress,
  })  : assert(currentProgress != null),
        assert(maxProgress != null);

  @override
  List<Object> get props => [currentProgress, maxProgress];
}
