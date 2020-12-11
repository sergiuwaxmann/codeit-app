import 'package:flutter/material.dart';

import 'package:codeitapp/widgets/course_headline.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CourseHeadline(
                course: widget.course,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
