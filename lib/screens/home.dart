import 'package:flutter/material.dart';

import 'package:codeitapp/widgets/custom_safe_area.dart';
import 'package:codeitapp/widgets/recent_course_card.dart';

import 'package:codeitapp/data/courses_data.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomSafeArea(
        child: RecentCourseCard(
          course: recentCourses[0],
        ),
      ),
    );
  }
}
