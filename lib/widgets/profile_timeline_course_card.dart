import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/course_logo.dart';

import 'package:codeitapp/model/course.dart';

class ProfileTimelineCourseCard extends StatelessWidget {
  final Course course;

  const ProfileTimelineCourseCard({
    Key key,
    @required this.course,
  }) : super(key: key);

  double _calculateWidth() {
    double sizeMultiplier =
        !SizeConfig.isTablet && SizeConfig.isPortrait ? 0.65 : 0.55;
    return sizeMultiplier *
        (SizeConfig.isPortrait
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.isPortrait ? 20 : 10,
            right: SizeConfig.isPortrait ? 20 : 10,
          ),
          child: Container(
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
                  color: course.bgColor1.withOpacity(0.3),
                  offset: Offset(0, 20),
                  blurRadius: 20,
                ),
                BoxShadow(
                  color: course.bgColor2.withOpacity(0.3),
                  offset: Offset(0, 20),
                  blurRadius: 20,
                )
              ],
            ),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(SizeConfig.isPortrait ? 40 : 30),
              child: Container(
                width: _calculateWidth(),
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        'assets/illustrations/${course.illustration}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                        22,
                      ),
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
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            course.title,
                            style:
                                Theme.of(context).textTheme.headline1.copyWith(
                                      fontSize:
                                          (SizeConfig.isPortrait ? 2.8 : 2.3) *
                                              SizeConfig.textMultiplier,
                                      color: Colors.white,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        CourseLogo(course: null),
      ],
    );
  }
}
