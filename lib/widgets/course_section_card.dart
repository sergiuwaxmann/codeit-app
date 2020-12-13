import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/model/course.dart';

class CourseSectionCard extends StatelessWidget {
  final Course course;

  const CourseSectionCard({
    Key key,
    @required this.course,
  }) : super(key: key);

  double _calculateMargin() {
    return 0.05 *
        (SizeConfig.isPortrait
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight);
  }

  @override
  Widget build(BuildContext context) {
    double _margin = _calculateMargin();

    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        height: (SizeConfig.isPortrait
                ? 0.15
                : (!SizeConfig.isTablet ? 0.25 : 0.2)) *
            SizeConfig.screenHeight,
        margin: EdgeInsets.symmetric(
          horizontal: _margin,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              course.bgColor1,
              course.bgColor2,
            ],
          ),
          borderRadius: BorderRadius.circular(SizeConfig.isPortrait ? 40 : 30),
          boxShadow: [
            BoxShadow(
              color: course.bgColor1.withOpacity(0.3),
              offset: Offset(0, 20),
              blurRadius: 30,
            ),
            BoxShadow(
              color: course.bgColor2.withOpacity(0.3),
              offset: Offset(0, 20),
              blurRadius: 30,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(SizeConfig.isPortrait ? 40 : 30),
          child: Container(
            padding: EdgeInsets.only(
              left: SizeConfig.isPortrait ? 32 : 22,
            ),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/illustrations/${course.illustration}',
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.subtitle,
                            style:
                                Theme.of(context).textTheme.bodyText2.copyWith(
                                      fontSize: 1.8 * SizeConfig.textMultiplier,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                          ),
                          Text(
                            course.title,
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(
                                  fontSize: (SizeConfig.isPortrait ? 2 : 2.2) *
                                      SizeConfig.textMultiplier,
                                  color: Colors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
