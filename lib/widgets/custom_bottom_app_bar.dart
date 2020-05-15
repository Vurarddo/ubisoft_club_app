import 'package:flutter/material.dart';

class CustomBottomAppBarItem {
  final IconData icon;
  final String title;

  CustomBottomAppBarItem({
    @required this.icon,
    @required this.title,
  })  : assert(icon != null),
        assert(title != null);
}

class CustomBottomAppBar extends StatelessWidget {
  final List<CustomBottomAppBarItem> items;
  final int currentIndex;
  final Color color;
  final Color selectedColor;
  final NotchedShape shape;
  final ValueChanged<int> onTabSelected;

  CustomBottomAppBar({
    @required this.items,
    this.currentIndex,
    this.color,
    this.selectedColor,
    this.shape,
    this.onTabSelected,
  })  : assert(items != null),
        assert(items.length == 2 || items.length == 4);

  _updateIndex(int index) {
    onTabSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = List.generate(items.length, (int index) {
      return _buildTabItem(
        context: context,
        item: items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    tabs.insert(tabs.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: shape,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: tabs,
        ),
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox.fromSize(
        size: Size.fromHeight(50.0),
      ),
    );
  }

  Widget _buildTabItem({
    BuildContext context,
    CustomBottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    final theme = Theme.of(context);
    Color tabColor = currentIndex == index ? selectedColor : color;
    double fontSize = currentIndex == index ? 14.0 : 12.0;

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: SizedBox(
        width: 75,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  item.icon,
                  color: tabColor,
                ),
                Text(
                  item.title,
                  style: theme.textTheme.caption.copyWith(
                    color: tabColor,
                    fontSize: fontSize,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
