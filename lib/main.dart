import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/side_menu_row.dart';

import 'package:codeitapp/data/side_menu_data.dart';

void main() {
  runApp(CodeITApp());
}

class CodeITApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().calc(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Code IT",
              home: Scaffold(
                body: Center(
                  child: SideMenuRow(
                    sideMenuItem: sideMenuItemsData[0],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
