import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/continue_watching_panel.dart';
import 'package:codeitapp/widgets/custom_safe_area.dart';
import 'package:codeitapp/widgets/explore_courses.dart';
import 'package:codeitapp/widgets/explore_headline.dart';
import 'package:codeitapp/widgets/header.dart';
import 'package:codeitapp/widgets/home_content_container.dart';
import 'package:codeitapp/widgets/recents_courses.dart';
import 'package:codeitapp/widgets/recents_headline.dart';
import 'package:codeitapp/widgets/side_menu.dart';
import 'package:codeitapp/widgets/side_menu_content.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    GlobalKey<SideMenuState> _sideMenuStateKey = GlobalKey();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            CustomSafeArea(
              child: HomeContentContainer(
                child: Column(
                  children: [
                    Header(
                      sideMenuAnimation: () =>
                          _sideMenuStateKey.currentState.showSideMenu(),
                    ),
                    Spacer(),
                    RecentsHeadline(),
                    RecentsCourses(),
                    Spacer(),
                    SizeConfig.isPortrait
                        ? ExploreHeadline()
                        : SizedBox.shrink(),
                    SizeConfig.isPortrait
                        ? ExploreCourses()
                        : SizedBox.shrink(),
                    SizeConfig.isPortrait ? Spacer() : SizedBox.shrink(),
                  ],
                ),
              ),
            ),
            ContinueWatchingPanel(),
            SideMenu(
              key: _sideMenuStateKey,
            ),
          ],
        ),
      ),
    );
  }
}
