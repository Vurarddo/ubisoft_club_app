import 'package:flutter/material.dart';

import 'package:ubisoft_club_app/helpers/get_time_ago.dart';
import 'package:ubisoft_club_app/localization.dart';
import 'package:ubisoft_club_app/models/models.dart';
import 'package:ubisoft_club_app/widgets/platform_title.dart';

class UserGameCard extends StatelessWidget {
  final Game game;
  final UserGameActivity userGamesActivity;

  const UserGameCard({
    Key key,
    @required this.game,
    @required this.userGamesActivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            _buildGameTile(context),
            _buildAchievementTile(context),
          ],
        ),
      ),
    );
  }

  Widget _buildGameTile(BuildContext context) {
    final theme = Theme.of(context);
    final localization = UbisoftClubLocalizations.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: SizedBox(
            height: 110,
            width: 80,
            child: Image.network(
              game.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 7.5, bottom: 10.0),
                  child: Text(
                    game.title,
                    style: theme.textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: PlatformTitle(platform: game.platform),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7.5),
                  child: Text(
                    '${localization.played}: ${getTimeAgo(userGamesActivity.lastTimeInGame)}',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAchievementTile(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[300],
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: <Widget>[
          _buildIconsTile(),
          Divider(
            color: Colors.grey[300],
            thickness: 1,
          ),
          _buildInfoTile(),
        ],
      ),
    );
  }

  Widget _buildIconsTile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Icon(
            Icons.monetization_on,
            color: Colors.orangeAccent,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Icon(Icons.crop_square),
        ),
        Icon(Icons.cake),
      ],
    );
  }

  Widget _buildInfoTile() {
    final achievements = userGamesActivity.achievements;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          '${achievements.first.currentProgress}/${achievements.first.maxProgress}',
        ),
        Text(
          '${achievements[1].currentProgress}/${achievements[1].maxProgress}',
        ),
        Text(
          '${achievements.last.currentProgress}/${achievements.last.maxProgress}',
        ),
      ],
    );
  }
}
