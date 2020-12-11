import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/custom_scroll_physics.dart';
import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/continue_watching_course_card.dart';

import 'package:codeitapp/data/courses_data.dart';

import 'package:codeitapp/screens/course.dart';

class ContinueWatchingCourses extends StatefulWidget {
  @override
  _ContinueWatchingCoursesState createState() =>
      _ContinueWatchingCoursesState();
}

class _ContinueWatchingCoursesState extends State<ContinueWatchingCourses> {
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
    for (var i = 0; i < continueWatchingCourses.length; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  PageView _buildPageView() {
    return PageView.builder(
      clipBehavior: Clip.none,
      itemCount: continueWatchingCourses.length,
      itemBuilder: (context, index) {
        return Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseScreen(
                    course: continueWatchingCourses[index],
                  ),
                  fullscreenDialog: true,
                ),
              );
            },
            child: Opacity(
              opacity: _currentPage == index ? 1 : 0.8,
              child: ContinueWatchingCourseCard(
                course: continueWatchingCourses[index],
                isActive: _currentPage == index,
                isFirst: _currentPage == 0,
                isLast: _currentPage == continueWatchingCourses.length - 1,
              ),
            ),
          ),
        );
      },
      controller: PageController(
        initialPage: 0,
        viewportFraction: 0.85,
      ),
      onPageChanged: (index) => setState(
        () {
          _currentPage = index;
        },
      ),
    );
  }

  ListView _buildListView({itemDimension}) {
    return ListView.builder(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      physics: CustomScrollPhysics(
        itemDimension: itemDimension,
      ),
      itemCount: continueWatchingCourses.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(
            right: index != continueWatchingCourses.length - 1 ? 40 : 0,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseScreen(
                    course: continueWatchingCourses[index],
                  ),
                  fullscreenDialog: true,
                ),
              );
            },
            child: ContinueWatchingCourseCard(
              course: continueWatchingCourses[index],
            ),
          ),
        );
      },
    );
  }

  double _calculateHeight() {
    double sizeMultiplier =
        !SizeConfig.isTablet && SizeConfig.isPortrait ? 0.35 : 0.3;
    return sizeMultiplier *
            (SizeConfig.isPortrait
                ? SizeConfig.screenWidth
                : SizeConfig.screenHeight) +
        40;
  }

  @override
  Widget build(BuildContext context) {
    double _height = _calculateHeight();

    return Column(
      children: [
        Container(
          height: _height,
          // width: double.infinity,
          child: !SizeConfig.isTablet && SizeConfig.isPortrait
              ? _buildPageView()
              : Container(
                  margin: EdgeInsets.only(
                    top: 15,
                  ),
                  child: _buildListView(
                    itemDimension: _height,
                  ),
                ),
        ),
        !SizeConfig.isTablet && SizeConfig.isPortrait
            ? Container(
                margin: EdgeInsets.only(
                  top: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
