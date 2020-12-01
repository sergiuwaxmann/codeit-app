import 'package:codeitapp/widgets/custom_safe_area.dart';
import 'package:codeitapp/widgets/side_menu_content.dart';
import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/app_theme.dart';
import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/screens/login.dart';
import 'package:codeitapp/screens/home.dart';

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
              theme: AppTheme.lightTheme,
              routes: {
                LoginScreen.routeName: (ctx) => LoginScreen(),
                HomeScreen.routeName: (ctx) => HomeScreen(),
              },
              home: HomeScreen(),
            );
          },
        );
      },
    );
  }
}
