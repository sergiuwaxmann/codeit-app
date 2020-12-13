import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

class CourseSectionsHeadline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.1 * SizeConfig.screenHeight,
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            30,
          ),
          bottomLeft: Radius.circular(
            30,
          ),
        ),
        boxShadow: [
          Theme.of(context).brightness == Brightness.light
              ? BoxShadow(
                  offset: Offset(0, -12),
                  blurRadius: 32,
                  color: Colors.black.withOpacity(0.2),
                )
              : BoxShadow(),
        ],
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.topCenter,
            child: Container(
              width: 42,
              height: 4,
              margin: EdgeInsets.only(
                top: (SizeConfig.isPortrait ? 0.015 : 0.01) *
                    SizeConfig.screenHeight,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black.withOpacity(0.2)
                    : Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          SafeArea(
            top: false,
            bottom: false,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.05 *
                    (SizeConfig.isPortrait
                        ? SizeConfig.screenWidth
                        : SizeConfig.screenHeight),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text(
                    'Course Sections',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(fontSize: 2.5 * SizeConfig.textMultiplier),
                  ),
                  SizeConfig.isPortrait
                      ? Text(
                          '12 sections',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontSize: 2 * SizeConfig.textMultiplier),
                        )
                      : SizedBox.shrink(),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
