import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/close_square_button.dart';
import 'package:codeitapp/widgets/course_logo.dart';
import 'package:codeitapp/widgets/play_square_button.dart';

import 'package:codeitapp/model/course.dart';

class CourseHeadline extends StatelessWidget {
  final Course course;

  const CourseHeadline({
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

    return Stack(
      children: [
        Container(
          height: (SizeConfig.isPortrait ? 0.5 : 0.4) * SizeConfig.screenHeight,
          padding: EdgeInsets.only(
            bottom: 20,
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
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 20),
                blurRadius: 20,
                color: course.bgColor1.withOpacity(0.3),
              ),
            ],
          ),
        ),
        !SizeConfig.isPortrait
            ? Container(
                height: (SizeConfig.isPortrait ? 0.5 : 0.4) *
                    SizeConfig.screenHeight,
                alignment: Alignment.centerRight,
                child: Hero(
                  tag: course.illustration,
                  child: Image.asset(
                    'assets/illustrations/${course.illustration}',
                    fit: BoxFit.fitWidth,
                    width: 0.5 * SizeConfig.screenWidth,
                  ),
                ),
              )
            : SizedBox.shrink(),
        Container(
          height: (SizeConfig.isPortrait ? 0.5 : 0.4) * SizeConfig.screenHeight,
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: _margin,
                    left: _margin,
                    right: _margin,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      course.logo != null
                          ? Hero(
                              tag: course.logo,
                              child: CourseLogo(
                                course: course,
                                hasMargin: false,
                              ),
                            )
                          : SizedBox.shrink(),
                      course.logo != null
                          ? SizedBox(
                              width: 15,
                            )
                          : SizedBox.shrink(),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                              tag: course.subtitle,
                              child: Text(
                                course.subtitle,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(
                                      fontSize: 2 * SizeConfig.textMultiplier,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                              ),
                            ),
                            Hero(
                              tag: course.title,
                              child: Text(
                                course.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(
                                      fontSize: 3 * SizeConfig.textMultiplier,
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CloseSquareButton(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizeConfig.isPortrait
                    ? Expanded(
                        child: Hero(
                          tag: course.illustration,
                          child: Image.asset(
                            'assets/illustrations/${course.illustration}',
                            fit: BoxFit.cover,
                            width: SizeConfig.screenWidth,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
        Container(
          height:
              (SizeConfig.isPortrait ? 0.52 : 0.45) * SizeConfig.screenHeight,
          alignment: Alignment.bottomRight,
          child: SafeArea(
            bottom: false,
            child: PlaySquareButton(),
          ),
        ),
      ],
    );
  }
}
