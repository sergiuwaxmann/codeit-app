import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:codeitapp/model/side_menu_item.dart';

var sideMenuItemsData = [
  SideMenuItem(
    title: 'Home',
    icon: Icons.home,
    bgColor1: Color(0xFF00AAFF),
    bgColor2: Color(0xFF0076FF),
  ),
  SideMenuItem(
    title: 'Courses',
    icon: Platform.isIOS ? CupertinoIcons.book_solid : Icons.library_books,
    bgColor1: Color(0xFFFA7d75),
    bgColor2: Color(0xFFC23D61),
  ),
  SideMenuItem(
    title: 'Billing',
    icon: Icons.credit_card,
    bgColor1: Color(0xFFFAD64A),
    bgColor2: Color(0xFFEA880F),
  ),
  SideMenuItem(
    title: 'Settings',
    icon: Platform.isIOS ? CupertinoIcons.settings_solid : Icons.settings,
    bgColor1: Color(0xFF4E62CC),
    bgColor2: Color(0xFF202A78),
  ),
];
