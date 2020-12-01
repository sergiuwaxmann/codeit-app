import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/explore_course_card.dart';

import 'package:codeitapp/data/courses_data.dart';

class ExploreCourses extends StatelessWidget {
  double _calculateHeight() {
    double sizeMultiplier =
        !SizeConfig.isTablet && SizeConfig.isPortrait ? 0.3 : 0.2;
    return sizeMultiplier *
        (SizeConfig.isPortrait
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _calculateHeight(),
      child: ListView.builder(
        // shrinkWrap: true,
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: exploreCourses.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
              right: index != exploreCourses.length - 1 ? 20 : 0,
            ),
            child: ExploreCourseCard(
              course: exploreCourses[index],
            ),
          );
        },
      ),
    );
  }
}
