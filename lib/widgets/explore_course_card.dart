import 'dart:io';

import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/model/course.dart';

class ExploreCourseCard extends StatelessWidget {
  final Course course;

  const ExploreCourseCard({
    Key key,
    @required this.course,
  }) : super(key: key);

  double _calculateWidth() {
    double sizeMultiplier =
        !SizeConfig.isTablet && SizeConfig.isPortrait ? 0.7 : 0.6;
    return sizeMultiplier *
        (SizeConfig.isPortrait
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(SizeConfig.isPortrait ? 40 : 30),
      child: Container(
        width: _calculateWidth(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              course.bgColor1,
              course.bgColor2,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.isPortrait ? 32 : 22,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizeConfig.isTablet || SizeConfig.isPortrait
                        ? Text(
                            course.subtitle,
                            style:
                                Theme.of(context).textTheme.bodyText2.copyWith(
                                      fontSize: 1.5 * SizeConfig.textMultiplier,
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
                            fontSize: (SizeConfig.isPortrait ? 2 : 1.8) *
                                SizeConfig.textMultiplier,
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/illustrations/${course.illustration}',
                  fit: BoxFit.cover,
                  height: !SizeConfig.isTablet ? 100 : 150,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
