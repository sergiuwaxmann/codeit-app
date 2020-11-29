import 'dart:io';

import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/course_logo.dart';

import 'package:codeitapp/model/course.dart';

class RecentCourseCard extends StatelessWidget {
  final Course course;

  const RecentCourseCard({
    Key key,
    @required this.course,
  }) : super(key: key);

  double _calculateSize() {
    double sizeMultiplier =
        !SizeConfig.isTablet && SizeConfig.isPortrait ? 0.6 : 0.4;
    return sizeMultiplier *
        (SizeConfig.isPortrait
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight);
  }

  @override
  Widget build(BuildContext context) {
    double _size = _calculateSize();
    double _padding = SizeConfig.isPortrait ? 32 : 22;

    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 20,
          ),
          child: Container(
            width: _size,
            height: _size,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  course.bgColor1,
                  course.bgColor2,
                ],
              ),
              borderRadius:
                  BorderRadius.circular(SizeConfig.isPortrait ? 40 : 30),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 30,
                  color: course.bgColor1.withOpacity(0.3),
                ),
                BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 30,
                  color: course.bgColor2.withOpacity(0.3),
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: _padding,
                    left: _padding,
                    right: _padding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizeConfig.isPortrait
                          ? Text(
                              course.subtitle,
                              style: TextStyle(
                                fontFamily:
                                    Platform.isIOS ? 'SF Pro Text' : null,
                                fontSize: 1.8 * SizeConfig.textMultiplier,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            )
                          : SizedBox.shrink(),
                      SizeConfig.isPortrait
                          ? SizedBox(
                              height: 5,
                            )
                          : SizedBox.shrink(),
                      Text(
                        course.title,
                        style: Theme.of(context).textTheme.headline1.copyWith(
                              fontSize: (SizeConfig.isPortrait ? 2.8 : 2.3) *
                                  SizeConfig.textMultiplier,
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: SizeConfig.isTablet && !SizeConfig.isPortrait
                          ? 30
                          : 0,
                    ),
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      'assets/illustrations/${course.illustration}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        CourseLogo(course: course),
      ],
    );
  }
}
