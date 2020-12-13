import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/course_section_card.dart';

import 'package:codeitapp/data/courses_data.dart';

class CourseSections extends StatelessWidget {
  List<Widget> _buildCourseSections(BuildContext context) {
    List<Widget> cards = [];
    double margin = 0.05 *
        (SizeConfig.isPortrait
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight);

    // for (var course in courseSections)
    //   cards.add(
    //     Container(
    //       padding: EdgeInsets.only(
    //         bottom: margin,
    //       ),
    //       child: CourseSectionCard(
    //         course: course,
    //       ),
    //     ),
    //   );

    for (var i = 0; i < courseSections.length; i++) {
      cards.add(
        Container(
          padding: EdgeInsets.only(
            top: i == 0
                ? !SizeConfig.isTablet && !SizeConfig.isPortrait
                    ? margin
                    : margin / 2
                : 0,
            bottom: margin,
          ),
          child: CourseSectionCard(
            course: courseSections[i],
          ),
        ),
      );
    }

    cards.add(
      Container(
        margin: EdgeInsets.only(
          bottom: margin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'No more ',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(fontSize: 1.8 * SizeConfig.textMultiplier),
            ),
            Text(
              'Sections',
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 1.8 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              ' to view.',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(fontSize: 1.8 * SizeConfig.textMultiplier),
            ),
          ],
        ),
      ),
    );

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: _buildCourseSections(context),
      ),
    );
  }
}
