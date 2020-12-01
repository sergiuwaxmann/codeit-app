import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/custom_safe_area.dart';
import 'package:codeitapp/widgets/custom_text_field.dart';
import 'package:codeitapp/widgets/primary_small_button.dart';

class LoginActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 0.05 * SizeConfig.screenWidth,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Log in to",
              style: Theme.of(context).textTheme.headline1.copyWith(
                    fontSize: 3 * SizeConfig.textMultiplier,
                  ),
            ),
            Text(
              "Start Learning",
              style: Theme.of(context).textTheme.headline1.copyWith(
                    fontSize: 3 * SizeConfig.textMultiplier,
                    color: Color(0xFF5B4CF0),
                  ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                color: Theme.of(context).brightness == Brightness.light
                    ? Color(0xFFFAFCFF)
                    : Theme.of(context).highlightColor,
                boxShadow: [
                  Theme.of(context).brightness == Brightness.light &&
                          SizeConfig.isPortrait
                      ? BoxShadow(
                          offset: Offset(0, 12),
                          blurRadius: 16,
                          color: Colors.black.withOpacity(0.2),
                        )
                      : BoxShadow(),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextField(
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    icon: Icons.mail,
                    cupertinoIcon: CupertinoIcons.mail_solid,
                    hint: "Email",
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  CustomTextField(
                    obscureText: true,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.go,
                    icon: Icons.lock,
                    cupertinoIcon: CupertinoIcons.lock_fill,
                    hint: "Password",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            PrimarySmallButton(
              text: "Log in",
              onTap: () => {},
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => {},
                  child: Text(
                    "Forgot password?",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 2 * SizeConfig.textMultiplier,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Color(0xFF1B1E9C).withOpacity(0.4)
                                  : Colors.white.withOpacity(0.8),
                        ),
                  ),
                ),
                GestureDetector(
                  onTap: () => {},
                  child: Text(
                    "Sign up",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 2 * SizeConfig.textMultiplier,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Color(0xFF1B1E9C).withOpacity(0.4)
                                  : Colors.white.withOpacity(0.8),
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
