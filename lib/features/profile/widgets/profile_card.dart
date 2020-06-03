import 'package:flutter/material.dart';

import 'package:ubisoft_club_app/localization.dart';
import 'package:ubisoft_club_app/models/user/user.dart';
import 'package:ubisoft_club_app/features/profile/widgets/add_achievement.dart';

class ProfileCard extends StatelessWidget {
  final User user;

  const ProfileCard({
    Key key,
    @required this.user,
  })  : assert(user != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            _buildProfileTile(context),
            _buildAchievementTile(context),
            _buildTimeInClubTile(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTile(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _buildLeading(),
          VerticalDivider(
            color: Colors.transparent,
            width: 15,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                _buildTitle(context),
                _buildLevelTile(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeading() {
    return SizedBox.fromSize(
      size: Size.square(65),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          user.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              user.clubName,
              style: theme.textTheme.headline6.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            if (user.clubUnits != null) ...{
              _buildTrailing(),
            },
          ],
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.cancel,
              size: 18.0,
            ),
            Text(
              ' ${user.platformName}',
              style: theme.textTheme.bodyText2,
            ),
          ],
        ),
        Divider(
          color: Colors.transparent,
          height: 6,
        ),
      ],
    );
  }

  Widget _buildTrailing() {
    return Row(
      children: <Widget>[
        Icon(
          Icons.monetization_on,
          color: Colors.orangeAccent,
        ),
        Text(' ${user.clubUnits}'),
      ],
    );
  }

  Widget _buildLevelTile(BuildContext context) {
    final localization = UbisoftClubLocalizations.of(context);
    final level = user.clubLevel;

    return Row(
      children: <Widget>[
        Icon(
          Icons.wifi_tethering,
          size: 18.0,
        ),
        Text(' ${localization.level} ${user.clubLevel.level}'),
        if (level.levelProgress != null && level.maxLevelProgress != null) ...{
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Material(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.transparent,
                clipBehavior: Clip.antiAlias,
                child: LinearProgressIndicator(
                  value: user.getParsedLevelProgress(
                    level.levelProgress,
                    level.maxLevelProgress,
                  ),
                ),
              ),
            ),
          ),
        },
      ],
    );
  }

  Widget _buildAchievementTile(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          AddAchievement(
            icon: Icons.add,
            color: theme.primaryColor,
          ),
          AddAchievement(
            icon: Icons.add,
            color: theme.primaryColor,
          ),
          AddAchievement(
            icon: Icons.add,
            color: theme.primaryColor,
          ),
          AddAchievement(
            icon: Icons.add,
            color: theme.primaryColor,
          ),
        ],
      ),
    );
  }

  Widget _buildTimeInClubTile(BuildContext context) {
    final theme = Theme.of(context);
    final localization = UbisoftClubLocalizations.of(context);

    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        color: Colors.grey[850].withOpacity(.9),
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.cake),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              '3!',
              style: theme.textTheme.headline1.copyWith(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Text(
            '${localization.yearsInClub(1)}',
            style: theme.textTheme.headline1.copyWith(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
