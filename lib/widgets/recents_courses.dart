import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/recent_course_card.dart';

import 'package:codeitapp/data/courses_data.dart';

class RecentsCourses extends StatefulWidget {
  @override
  _RecentsCoursesState createState() => _RecentsCoursesState();
}

class _RecentsCoursesState extends State<RecentsCourses> {
  int _currentPage = 0;

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      width: isActive ? 24 : 8,
      height: 8,
      margin: EdgeInsets.symmetric(
        horizontal: 4,
      ),
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).accentColor
            : Theme.of(context).brightness == Brightness.light
                ? Colors.black.withOpacity(0.2)
                : Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      duration: Duration(
        milliseconds: 250,
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (var i = 0; i < recentCourses.length; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  double _calculateHeight() {
    double sizeMultiplier =
        !SizeConfig.isTablet && SizeConfig.isPortrait ? 0.6 : 0.4;
    return sizeMultiplier *
            (SizeConfig.isPortrait
                ? SizeConfig.screenWidth
                : SizeConfig.screenHeight) +
        40;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: _calculateHeight(),
          width: double.infinity,
          child: PageView.builder(
            clipBehavior: Clip.none,
            // scrollDirection: Axis.horizontal,
            itemCount: recentCourses.length,
            itemBuilder: (context, index) {
              return Center(
                child: Opacity(
                  opacity: _currentPage == index ? 1 : 0.8,
                  child: RecentCourseCard(
                    course: recentCourses[index],
                    isActive: _currentPage == index,
                  ),
                ),
              );
            },
            controller: PageController(
              initialPage: 0,
              viewportFraction: 0.75,
            ),
            onPageChanged: (index) => setState(() {
              _currentPage = index;
            }),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageIndicator(),
          ),
        ),
      ],
    );
  }
}
