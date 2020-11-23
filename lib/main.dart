import 'package:flutter/material.dart';

import 'package:codeitapp/data/side_menu_data.dart';

import 'package:codeitapp/widgets/side_menu_row.dart';

void main() {
  runApp(CodeITApp());
}

class CodeITApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SideMenuRow(
            sideMenuItem: sideMenuItemsData[0],
          ),
        ),
      ),
    );
  }
}
