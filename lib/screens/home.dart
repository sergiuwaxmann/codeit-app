import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:codeitapp/widgets/custom_safe_area.dart';
import 'package:codeitapp/widgets/header.dart';
import 'package:codeitapp/widgets/recents_courses.dart';
import 'package:codeitapp/widgets/recents_headline.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomSafeArea(
        child: Column(
          children: [
            Header(),
            RecentsHeadline(),
            RecentsCourses(),
          ],
        ),
      ),
    );
  }
}
