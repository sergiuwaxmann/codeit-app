import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'package:codeitapp/providers/theme_notifier.dart';

import 'package:codeitapp/utilities/app_theme.dart';
import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/screens/login.dart';
import 'package:codeitapp/screens/home.dart';
import 'package:codeitapp/screens/profile.dart';
import 'package:codeitapp/screens/settings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then(
    (prefs) {
      var darkModeOn = prefs.getBool('darkMode') ?? false;
      runApp(
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(
            !darkModeOn ? AppTheme.lightTheme : AppTheme.darkTheme,
          ),
          child: CodeITApp(),
        ),
      );
    },
  );
}

class CodeITApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().calc(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Code IT",
              theme: themeNotifier.getTheme(),
              routes: {
                LoginScreen.routeName: (ctx) => LoginScreen(),
                HomeScreen.routeName: (ctx) => HomeScreen(),
                ProfileScreen.routeName: (ctx) => ProfileScreen(),
                SettingsScreen.routeName: (ctx) => SettingsScreen(),
              },
              home: LoginScreen(),
            );
          },
        );
      },
    );
  }
}
