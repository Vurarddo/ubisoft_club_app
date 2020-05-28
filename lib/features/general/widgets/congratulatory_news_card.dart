import 'package:flutter/material.dart';

import 'package:ubisoft_club_app/localization.dart';
import 'package:ubisoft_club_app/models/news/news.dart';
import 'package:ubisoft_club_app/helpers/get_time_ago.dart';
import 'package:ubisoft_club_app/widgets/congratulatory_progress_bar.dart';

class CongratulatoryNewsCard extends StatelessWidget {
  final CongratulatoryNews news;

  const CongratulatoryNewsCard({
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

    return ListTile(
      onTap: () {
        // TODO: add navigation
      },
      leading: SizedBox.fromSize(
        size: Size.square(50),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            news.profile.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        news.profile.clubName,
        style: theme.textTheme.subtitle1.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${getTimeAgo(news.published)}',
            style: theme.textTheme.caption,
          ),
          Text(''),
        ],
      ),
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

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 10.0),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: '${news.progressValue.toStringAsFixed(0)} ',
              style: theme.textTheme.bodyText2,
            ),
            _challengeType(news.challengeType, localization),
            TextSpan(
              text: localization.isCompletedInUbisoftGames,
              style: theme.textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWithProgressBar(BuildContext context) {
    final theme = Theme.of(context);
    final localization = UbisoftClubLocalizations.of(context);

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
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              '${localization.congratulations.toUpperCase()}!',
              style: theme.textTheme.headline5.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox.fromSize(
            size: Size.square(120),
            child: CongratulatoryProgressBar(value: news.progressValue),
          ),
        ],
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
            color: theme.highlightColor,
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
