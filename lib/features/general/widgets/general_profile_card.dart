import 'package:flutter/material.dart';

import 'package:ubisoft_club_app/localization.dart';
import 'package:ubisoft_club_app/models/user/user.dart';
import 'package:ubisoft_club_app/features/profile/profile_screen.dart';

class GeneralProfileCard extends StatelessWidget {
  final User user;

  const GeneralProfileCard({
    Key key,
    @required this.user,
  })  : assert(user != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(8.0, 7.0, 8.0, 4.0),
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
    Navigator.push(context, ProfileScreen.getPageRoute(user));
  }

  Widget _buildProfileTile(BuildContext context) {
    return Container(
      height: 65,
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
    final localization = UbisoftClubLocalizations.of(context);

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            user.clubName,
            style: theme.textTheme.headline6.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '${localization.clubLevel}: ${user.clubLevel.level}',
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
        Text(' ${user.clubUnits}'),
      ],
    );
  }
}
