import 'dart:io';

import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/course_logo.dart';

import 'package:codeitapp/model/course.dart';

class RecentCourseCard extends StatelessWidget {
  final Course course;
  final bool isActive, isFirst, isLast;

  const RecentCourseCard({
    Key key,
    @required this.course,
    this.isActive = true,
    this.isFirst = false,
    this.isLast = false,
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

    return AnimatedContainer(
      padding: EdgeInsets.only(
        top: isActive ? 0 : 20,
        left: isLast ? 60 : 0,
        right: isFirst ? 60 : 0,
      ),
      child: Stack(
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
                  isActive
                      ? BoxShadow(
                          offset: Offset(0, 20),
                          blurRadius: 30,
                          color: course.bgColor1.withOpacity(0.3),
                        )
                      : BoxShadow(),
                  isActive
                      ? BoxShadow(
                          offset: Offset(0, 20),
                          blurRadius: 30,
                          color: course.bgColor2.withOpacity(0.3),
                        )
                      : BoxShadow(),
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
                        SizeConfig.isTablet || SizeConfig.isPortrait
                            ? Hero(
                                tag: course.subtitle,
                                child: Text(
                                  course.subtitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(
                                        fontSize:
                                            1.8 * SizeConfig.textMultiplier,
                                        color: Colors.white.withOpacity(0.8),
                                      ),
                                ),
                              )
                            : SizedBox.shrink(),
                        SizeConfig.isPortrait
                            ? SizedBox(
                                height: 5,
                              )
                            : SizedBox.shrink(),
                        Hero(
                          tag: course.title,
                          child: Text(
                            course.title,
                            style:
                                Theme.of(context).textTheme.headline1.copyWith(
                                      fontSize:
                                          (SizeConfig.isPortrait ? 2.8 : 2.3) *
                                              SizeConfig.textMultiplier,
                                      color: Colors.white,
                                    ),
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
                      child: Hero(
                        tag: course.illustration,
                        child: Image.asset(
                          'assets/illustrations/${course.illustration}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Hero(
            tag: course.logo,
            child: CourseLogo(course: course),
          ),
        ],
      ),
      duration: Duration(
        milliseconds: 250,
      ),
    );
  }
}
