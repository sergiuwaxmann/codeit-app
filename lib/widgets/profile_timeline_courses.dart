import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/custom_scroll_physics.dart';
import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/profile_timeline_course_card.dart';

import 'package:codeitapp/screens/course.dart';

import 'package:codeitapp/data/courses_data.dart';

class ProfileTimelineCourses extends StatelessWidget {
  ListView _buildListView({itemDimension}) {
    return ListView.builder(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      physics: CustomScrollPhysics(
        itemDimension: itemDimension,
      ),
      itemCount: completedCourses.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(
            right: index != completedCourses.length - 1 ? 40 : 0,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseScreen(
                    course: completedCourses[index],
                  ),
                  fullscreenDialog: true,
                ),
              );
            },
            child: ProfileTimelineCourseCard(
              course: completedCourses[index],
            ),
          ),
        );
      },
    );
  }

  double _calculateHeight() {
    double sizeMultiplier =
        !SizeConfig.isTablet && SizeConfig.isPortrait ? 0.35 : 0.275;
    return sizeMultiplier *
            (SizeConfig.isPortrait
                ? SizeConfig.screenWidth
                : SizeConfig.screenHeight) +
        20;
  }

  @override
  Widget build(BuildContext context) {
    double _height = _calculateHeight();

    return Container(
      height: _height,
      margin: EdgeInsets.only(
        top: 15,
      ),
      child: _buildListView(
        itemDimension: _height,
      ),
    );
  }
}
