import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/model/course.dart';

class CourseLogo extends StatelessWidget {
  final Course course;

  const CourseLogo({
    Key key,
    @required this.course,
  }) : super(key: key);

  double _calculateSize() {
    double sizeMultiplier = SizeConfig.isPortrait ? 0.13 : 0.1;
    return sizeMultiplier *
        (SizeConfig.isPortrait
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight);
  }

  @override
  Widget build(BuildContext context) {
    double _size = _calculateSize();

    return Padding(
      padding: EdgeInsets.only(
        right: _size / (SizeConfig.isPortrait ? 1 : 1.5),
      ),
      child: Container(
        width: _size,
        height: _size,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 16,
                color: Colors.black.withOpacity(0.2),
              ),
            ]),
        child: SvgPicture.asset(
          'assets/logos/${course.logo}',
          fit: BoxFit.scaleDown, // ? Is it necessary?
        ),
      ),
    );
  }
}
