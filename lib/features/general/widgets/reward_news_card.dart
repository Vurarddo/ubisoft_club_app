import 'package:flutter/material.dart';

import 'package:ubisoft_club_app/localization.dart';
import 'package:ubisoft_club_app/models/news/news.dart';
import 'package:ubisoft_club_app/helpers/get_time_ago.dart';

class RewardNewsCard extends StatelessWidget {
  final RewardNews news;

  const RewardNewsCard({
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
          child: Image.asset('assets/images/avatar.jpg'),
        ),
      ),
      title: Text(
        'VladOS',
        style: theme.textTheme.subtitle1.copyWith(fontWeight: FontWeight.w600),
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
    );
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

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 10.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: theme.highlightColor,
                width: 2,
              ),
            ),
            child: Icon(
              Icons.cake,
              color: theme.highlightColor,
            ),
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '  ${localization.redeemed} ',
                  style: theme.textTheme.bodyText2,
                ),
                _rewardQuality(news.rewardQuality, localization),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageWithProgressBar(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          news.image,
          fit: BoxFit.cover,
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

TextSpan _rewardQuality(
    RewardQuality quality, UbisoftClubLocalizations localization) {
  switch (quality) {
    case RewardQuality.Legendary:
      return TextSpan(
        text: '${localization.legendaryReward} ',
        style: TextStyle(color: Colors.orange),
      );
    case RewardQuality.Epic:
      return TextSpan(
        text: '${localization.epicReward} ',
        style: TextStyle(color: Colors.purpleAccent),
      );
    case RewardQuality.Rare:
      return TextSpan(
        text: '${localization.rareReward} ',
        style: TextStyle(color: Colors.lightBlue),
      );
    case RewardQuality.Common:
      return TextSpan(
        text: '${localization.commonReward} ',
        style: TextStyle(color: Colors.grey[600]),
      );
    case RewardQuality.Exotic:
      return TextSpan(
        text: '${localization.exoticReward} ',
        style: TextStyle(color: Colors.yellow[600]),
      );
    default:
      return TextSpan();
  }
}
