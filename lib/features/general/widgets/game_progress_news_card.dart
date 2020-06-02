import 'package:flutter/material.dart';

import 'package:ubisoft_club_app/theme/colors.dart';
import 'package:ubisoft_club_app/localization.dart';
import 'package:ubisoft_club_app/models/news/news.dart';
import 'package:ubisoft_club_app/helpers/get_time_ago.dart';
import 'package:ubisoft_club_app/widgets/circular_progress_bar.dart';
import 'package:ubisoft_club_app/features/profile/profile_screen.dart';

class GameProgressNewsCard extends StatelessWidget {
  final GameProgressNews news;

  const GameProgressNewsCard({
    Key key,
    @required this.news,
  })  : assert(news != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 3.0,
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: <Widget>[
            _buildProfileListTile(context),
            _buildDivider(),
            GestureDetector(
              onTap: () {
                // TODO: add navigation
              },
              child: _buildGameCard(context),
            ),
            _buildAddToFavoriteTile(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileListTile(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.5),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 7.5),
          onTap: () => _navigateToProfileScreen(context),
          leading: SizedBox.fromSize(
            size: Size.square(50),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                news.user.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            news.user.clubName,
            style:
                theme.textTheme.subtitle1.copyWith(fontWeight: FontWeight.w600),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${getTimeAgo(news.published)}',
                style: theme.textTheme.caption,
              ),
              _buildGameTile(context),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToProfileScreen(BuildContext context) {
    Navigator.push(context, ProfileScreen.getPageRoute(news.user));
  }

  Widget _buildGameTile(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: <Widget>[
        Text(
          news.gameName,
          style: theme.textTheme.caption.copyWith(
            color: theme.textTheme.subtitle1.color,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 8.0),
          padding: EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
              border: Border.all(color: theme.textTheme.subtitle1.color),
              borderRadius: BorderRadius.circular(4.0)),
          child: Text(
            news.platform,
            style: theme.textTheme.caption.copyWith(
              color: theme.textTheme.subtitle1.color,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Divider(
      indent: 16,
      endIndent: 16,
      thickness: 1,
      height: 20,
    );
  }

  Widget _buildGameCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildChallengeTextTile(context),
        _buildImageWithProgressBar(context),
      ],
    );
  }

  Widget _buildChallengeTextTile(BuildContext context) {
    final theme = Theme.of(context);
    final localization = UbisoftClubLocalizations.of(context);
    final progressValue = news.progress > 100 ? 100 : news.progress;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 10.0),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            if (news.gameMode != null) ...{
              TextSpan(
                text: '${news.gameMode}: ',
                style: theme.textTheme.bodyText1,
              ),
            },
            TextSpan(
              text: '${progressValue.toStringAsFixed(0)}% ',
              style: theme.textTheme.bodyText2,
            ),
            _challengeType(news.challengeType, localization),
            TextSpan(
              text: localization.isCompleted,
              style: theme.textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWithProgressBar(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.unselectedWidgetColor,
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.dstATop,
          ),
          image: NetworkImage(news.image),
        ),
      ),
      child: SizedBox.fromSize(
        size: Size.square(120),
        child: CircleProgressBar(
          progressValue: news.progress,
          backgroundColor: theme.unselectedWidgetColor,
          gradient: LinearGradient(
            colors: [cyanColor, darkCyanColor],
            end: Alignment.centerLeft,
            begin: Alignment.topRight,
            tileMode: TileMode.repeated,
          ),
          completeGradient: LinearGradient(
            colors: [Colors.green[300], Colors.green],
            end: Alignment.topLeft,
            begin: Alignment.topRight,
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }

  Widget _buildAddToFavoriteTile(BuildContext context) {
    final localization = UbisoftClubLocalizations.of(context);
    final theme = Theme.of(context);

    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.favorite_border,
            color: theme.primaryColorLight,
          ),
          onPressed: () {
            // TODO: add action
          },
        ),
        Text(localization.like),
      ],
    );
  }
}

TextSpan _challengeType(
    ChallengeType type, UbisoftClubLocalizations localization) {
  switch (type) {
    case ChallengeType.weekly:
      return TextSpan(
        text: '${localization.weeklyChallenges} ',
        style: TextStyle(color: Colors.orangeAccent),
      );
    case ChallengeType.classic:
      return TextSpan(
        text: '${localization.classicChallenges} ',
        style: TextStyle(color: Colors.orangeAccent),
      );
    default:
      return TextSpan();
  }
}
