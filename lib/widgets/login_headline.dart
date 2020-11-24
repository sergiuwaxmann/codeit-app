import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/custom_safe_area.dart';

class LoginHeadline extends StatelessWidget {
  const LoginHeadline({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: 0.1 * SizeConfig.screenWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Learn programming,\nthe easy way",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1.copyWith(
                    fontSize: 3 * SizeConfig.textMultiplier,
                    color: Colors.white,
                  ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Courses about industry leading\ntools and platforms",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 2 * SizeConfig.textMultiplier,
                    color: Colors.white.withOpacity(0.8),
                  ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 0.6 * SizeConfig.screenWidth,
              margin: EdgeInsets.only(
                left: 0.2 * SizeConfig.screenWidth,
              ),
              child: SvgPicture.asset(
                "assets/illustrations/login.svg",
                fit: BoxFit.scaleDown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
