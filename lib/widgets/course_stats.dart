import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/model/course.dart';

class CourseStats extends StatelessWidget {
  final Course course;
  final IconData icon;
  final String value, description;

  const CourseStats({
    Key key,
    @required this.course,
    @required this.icon,
    @required this.value,
    @required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                course.bgColor1,
                course.bgColor2,
              ],
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? Color(0xFF1F364D)
                  : Color(0xFF17294D),
              radius: 22,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(fontSize: 2 * SizeConfig.textMultiplier),
            ),
            Text(
              description,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(fontSize: 1.5 * SizeConfig.textMultiplier),
            ),
          ],
        ),
      ],
    );
  }
}
