import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/course_headline.dart';
import 'package:codeitapp/widgets/course_stats.dart';
import 'package:codeitapp/widgets/course_text_content.dart';

import 'package:codeitapp/model/course.dart';

class CourseScreen extends StatelessWidget {
  final Course course;

  const CourseScreen({
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

    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CourseHeadline(
                course: course,
              ),
              SafeArea(
                top: false,
                child: Container(
                  margin: EdgeInsets.only(
                    left: _margin,
                    right: _margin,
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: SizeConfig.isPortrait
                              ? MainAxisAlignment.spaceAround
                              : MainAxisAlignment.spaceEvenly,
                          children: [
                            CourseStats(
                              course: course,
                              icon: Platform.isIOS
                                  ? CupertinoIcons.group_solid
                                  : Icons.people,
                              value: '28.7k',
                              description: 'Students',
                            ),
                            CourseStats(
                              course: course,
                              icon: Platform.isIOS
                                  ? CupertinoIcons.news_solid
                                  : Icons.format_quote,
                              value: '12.4k',
                              description: 'Comments',
                            ),
                          ],
                        ),
                      ),
                      // TODO:
                      // Container(
                      //   margin: EdgeInsets.symmetric(
                      //     vertical: 15,
                      //   ),
                      // ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 15,
                          bottom: _margin,
                        ),
                        child: CourseTextContent(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
