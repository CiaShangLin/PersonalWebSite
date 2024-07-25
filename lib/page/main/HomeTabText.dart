
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/ColorUtil.dart';
import 'MainTab.dart';

class HomeTabText extends StatelessWidget {
  final MainTab mainTab;
  final bool isSelected;
  final Function(MainTab) onTap;

  const HomeTabText({
    Key? key,
    required this.mainTab,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(mainTab),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Text(
          mainTab.label,
          style: TextStyle(
            color: isSelected ? tab_selected_color : tab_unselected_color,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}