import 'package:flutter/material.dart';

import 'package:codeitapp/widgets/custom_safe_area.dart';
import 'package:codeitapp/widgets/explore_courses.dart';
import 'package:codeitapp/widgets/explore_headline.dart';
import 'package:codeitapp/widgets/page_content_container.dart';
import 'package:codeitapp/widgets/recents_courses.dart';
import 'package:codeitapp/widgets/recents_headline.dart';
import 'package:codeitapp/widgets/side_menu.dart';
import 'package:codeitapp/widgets/side_menu_content.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: CustomSafeArea(
                child: PageContentContainer(
                  child: Column(
                    children: [
                      RecentsHeadline(),
                      RecentsCourses(),
                      ExploreHeadline(),
                      ExploreCourses()
                    ],
                  ),
                ),
              ),
            ),
            SideMenu(
              sideMenuContent: SideMenuContent(),
            ),
          ],
        ),
      ),
    );
  }
}
