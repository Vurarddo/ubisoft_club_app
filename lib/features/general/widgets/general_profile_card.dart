import 'package:flutter/material.dart';

import 'package:ubisoft_club_app/localization.dart';
import 'package:ubisoft_club_app/models/user/user.dart';
import 'package:ubisoft_club_app/features/profile/profile_screen.dart';

class GeneralProfileCard extends StatelessWidget {
  final User profile;

  const GeneralProfileCard({
    Key key,
    @required this.profile,
  })  : assert(profile != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => _navigateToProfileScreen(context),
          child: _buildProfileTile(context),
        ),
      ),
    );
  }

  void _navigateToProfileScreen(BuildContext context) {
    Navigator.push(context, ProfileScreen.getPageRoute(profile));
  }

  Widget _buildProfileTile(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      margin: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _buildLeading(),
          VerticalDivider(
            color: Colors.transparent,
            width: 15,
          ),
          _buildTitle(context),
          _buildTrailing(),
        ],
      ),
    );
  }

  Widget _buildLeading() {
    return SizedBox.fromSize(
      size: Size.square(60),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          profile.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final theme = Theme.of(context);
    final localization = UbisoftClubLocalizations.of(context);

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            profile.clubName,
            style: theme.textTheme.headline6.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '${localization.clubLevel}: ${profile.lvl}',
            style: theme.textTheme.subtitle1,
          ),
        ],
      ),
    );
  }

  Widget _buildTrailing() {
    return Row(
      children: <Widget>[
        Icon(
          Icons.monetization_on,
          color: Colors.orangeAccent,
        ),
        Text('${profile.clubUnits}'),
      ],
    );
  }
}
