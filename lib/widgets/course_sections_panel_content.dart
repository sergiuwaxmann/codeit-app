import 'package:flutter/material.dart';

import 'package:codeitapp/widgets/course_sections.dart';
import 'package:codeitapp/widgets/course_sections_headline.dart';

class CourseSectionsPanelContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            30,
          ),
        ),
      ),
      child: Column(
        children: [
          CourseSectionsHeadline(),
          CourseSections(),
        ],
      ),
    );
  }
}
