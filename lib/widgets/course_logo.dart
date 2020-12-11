import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/model/course.dart';

class CourseLogo extends StatelessWidget {
  final Course course;
  final bool hasMargin;

  const CourseLogo({
    Key key,
    @required this.course,
    this.hasMargin = true,
  }) : super(key: key);

  double _calculateSize() {
    double sizeMultiplier =
        !SizeConfig.isTablet ? (SizeConfig.isPortrait ? 0.13 : 0.1) : 0.08;
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
        right: course != null && hasMargin
            ? _size / (SizeConfig.isPortrait ? 1 : 1.5)
            : 0,
      ),
      child: Container(
        width: _size,
        height: _size,
        padding: EdgeInsets.all(8),
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
          course != null
              ? 'assets/logos/${course.logo}'
              : 'assets/icons/play.svg',
        ),
      ),
    );
  }
}
