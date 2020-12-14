import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/profile_badges.dart';
import 'package:codeitapp/widgets/profile_navigation.dart';
import 'package:codeitapp/widgets/profile_user_details.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  double _calculateMargin() {
    return 0.05 *
        (SizeConfig.isPortrait
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight);
  }

  @override
  Widget build(BuildContext context) {
    double _margin = _calculateMargin();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).highlightColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                ),
                boxShadow: [
                  Theme.of(context).brightness == Brightness.light
                      ? BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0, -12),
                          blurRadius: 32,
                        )
                      : BoxShadow(),
                ],
              ),
              child: SafeArea(
                bottom: false,
                child: Container(
                  padding: EdgeInsets.only(
                    top: _margin,
                    left: _margin,
                    right: _margin,
                  ),
                  child: Column(
                    children: [
                      ProfileNavigation(),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: _margin,
                        ),
                        child: ProfileUserDetails(),
                      ),
                      SizeConfig.isPortrait
                          ? ProfileBadges()
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
