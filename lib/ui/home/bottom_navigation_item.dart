import 'package:flutter/material.dart';

import '../theme/my_theme.dart';

class BottomNavigationItem extends BottomNavigationBarItem {
  BottomNavigationItem(String label, {String? iconPath=null ,Icon? icon})
      : super(
            icon: icon!=null ? icon :ImageIcon(AssetImage(iconPath!)),
            label: label,
            );
}
