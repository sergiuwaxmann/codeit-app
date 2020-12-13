import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/course_headline.dart';
import 'package:codeitapp/widgets/course_navigation.dart';
import 'package:codeitapp/widgets/course_stats.dart';
import 'package:codeitapp/widgets/course_text_content.dart';
import 'package:codeitapp/widgets/view_all_button.dart';

import 'package:codeitapp/model/course.dart';

class CourseScreen extends StatefulWidget {
  final Course course;

  const CourseScreen({
    Key key,
    @required this.course,
  }) : super(key: key);

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  PanelController _panelController;

  @override
  void initState() {
    super.initState();
    _panelController = PanelController();
  }

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
      body: SlidingUpPanel(
        controller: _panelController,
        backdropEnabled: true,
        backdropColor: Colors.black.withOpacity(0.25),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            30,
          ),
        ),
        color: Theme.of(context).primaryColor,
        boxShadow: [
          Theme.of(context).brightness == Brightness.light
              ? BoxShadow(
                  offset: Offset(0, -12),
                  blurRadius: 32,
                  color: Colors.black.withOpacity(0.2),
                )
              : BoxShadow(),
        ],
        minHeight: 0,
        maxHeight: 0.9 * SizeConfig.screenHeight,
        panel: Container(),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CourseHeadline(
                  course: widget.course,
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
                            top: SizeConfig.isPortrait ? 30 : 15,
                          ),
                          child: Row(
                            mainAxisAlignment: SizeConfig.isPortrait
                                ? MainAxisAlignment.spaceAround
                                : MainAxisAlignment.spaceEvenly,
                            children: [
                              CourseStats(
                                course: widget.course,
                                icon: Platform.isIOS
                                    ? CupertinoIcons.group_solid
                                    : Icons.people,
                                value: '28.7k',
                                description: 'Students',
                              ),
                              CourseStats(
                                course: widget.course,
                                icon: Platform.isIOS
                                    ? CupertinoIcons.news_solid
                                    : Icons.format_quote,
                                value: '12.4k',
                                description: 'Comments',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: SizeConfig.isPortrait ? 30 : 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CourseNavigation(),
                              ViewAllButton(
                                onTap: () => _panelController.open(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
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
      ),
    );
  }
}
