import 'package:flutter/material.dart';

import 'package:ubisoft_club_app/localization.dart';
import 'package:ubisoft_club_app/models/news.dart';
import 'package:ubisoft_club_app/helpers/get_time_ago.dart';
import 'package:ubisoft_club_app/features/profile/profile_screen.dart';
import 'package:ubisoft_club_app/widgets/platform_title.dart';

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
              borderRadius: BorderRadius.circular(8),
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
        PlatformTitle(platform: news.platform),
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
        _buildImageWithTitle(context),
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
                color: theme.primaryColorLight,
                width: 2,
              ),
            ),
            child: Icon(
              Icons.cake,
              color: theme.primaryColorLight,
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

  Widget _buildImageWithTitle(BuildContext context) {
    final theme = Theme.of(context);

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 130,
        minWidth: double.infinity,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.0),
          border: Border.all(color: theme.dividerColor),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  Image.network(
                    news.image,
                    fit: BoxFit.cover,
                  ),
                  ClipPath(
                    clipper: _TriangleClipper(),
                    child: Container(
                      height: 20,
                      width: 20,
                      color: _rewardQualityColor(news.rewardQuality),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(news.title),
              )
            ],
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

Color _rewardQualityColor(RewardQuality quality) {
  switch (quality) {
    case RewardQuality.legendary:
      return Colors.orange;
    case RewardQuality.epic:
      return Colors.purpleAccent;
    case RewardQuality.rare:
      return Colors.lightBlue;
    case RewardQuality.common:
      return Colors.grey[600];
    case RewardQuality.exotic:
      return Colors.yellow[600];
    default:
      return Colors.orangeAccent;
  }
}

TextSpan _rewardQuality(
    RewardQuality quality, UbisoftClubLocalizations localization) {
  switch (quality) {
    case RewardQuality.legendary:
      return TextSpan(
        text: '${localization.legendaryReward} ',
        style: TextStyle(color: Colors.orange),
      );
    case RewardQuality.epic:
      return TextSpan(
        text: '${localization.epicReward} ',
        style: TextStyle(color: Colors.purpleAccent),
      );
    case RewardQuality.rare:
      return TextSpan(
        text: '${localization.rareReward} ',
        style: TextStyle(color: Colors.lightBlue),
      );
    case RewardQuality.common:
      return TextSpan(
        text: '${localization.commonReward} ',
        style: TextStyle(color: Colors.grey[600]),
      );
    case RewardQuality.exotic:
      return TextSpan(
        text: '${localization.exoticReward} ',
        style: TextStyle(color: Colors.yellow[600]),
      );
    default:
      return TextSpan();
  }
}

class _TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path
      ..moveTo(0, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(_TriangleClipper oldClipper) => false;
}
