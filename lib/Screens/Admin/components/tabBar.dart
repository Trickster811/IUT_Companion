import 'package:flutter/material.dart';
import 'package:iut_companion/constants.dart';

class AdminTabBar extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;

  const AdminTabBar({Key? key, required this.index, required this.onChangedTab})
      : super(key: key);

  @override
  State<AdminTabBar> createState() => _AdminTabBarState();
}

class _AdminTabBarState extends State<AdminTabBar> {
  Widget build(BuildContext context) {
    final items = [
      Icon(
        Icons.home_filled,
        size: 30.0,
      ),
      Icon(
        Icons.dashboard,
        size: 30.0,
      ),
      Icon(
        Icons.search_rounded,
        size: 30.0,
      ),
      Icon(
        Icons.settings,
        size: 30.0,
      ),
    ];

    final placeholder = Opacity(
        opacity: 0,
        child: IconButton(
          icon: Icon(Icons.no_cell),
          onPressed: null,
        ));
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTabView(
            0,
            items[0],
          ),
          buildTabView(
            1,
            items[1],
          ),
          placeholder,
          buildTabView(
            2,
            items[2],
          ),
          buildTabView(
            3,
            items[3],
          ),
        ],
      ),
    );
  }

  Widget buildTabView(int index, Icon icon) {
    final isSelected = index == widget.index;
    return IconTheme(
      data: IconThemeData(color: isSelected ? kPrimaryColor : Colors.black),
      child: IconButton(
        onPressed: () => widget.onChangedTab(index),
        icon: icon,
      ),
    );
  }
}
