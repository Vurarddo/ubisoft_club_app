import 'package:flutter/material.dart';

class GeneralCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _buildProfileListTile(context),
        ],
      ),
    );
  }

  Widget _buildProfileListTile(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Container(
        color: Colors.orange,
        width: 45,
        height: 45,
      ),
      title: Text(
        'VladOS',
        style: theme.textTheme.subhead.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '2 hours ago',
            style: theme.textTheme.caption,
          ),
          Text(
            'Tom Clancy\'s Rainbow Six Siege',
            style: theme.textTheme.caption,
          ),
        ],
      ),
    );
  }
}
