import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/background_svg.dart';
import 'package:codeitapp/widgets/login_actions.dart';
import 'package:codeitapp/widgets/login_headline.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    // ! Probably not the best practice:
    bool _isKeyboardShown = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      backgroundColor: Color(0xFFF1F4FB),
      body: Stack(
        children: [
          !_isKeyboardShown
              ? BackgroundSvg(
                  svg: "assets/backgrounds/background-login.svg",
                )
              : SizedBox.shrink(),
          SizeConfig.isPortrait && !_isKeyboardShown
              ? LoginHeadline()
              : SizedBox.shrink(),
          SizeConfig.isPortrait
              ? LoginActions()
              : Center(
                  child: SingleChildScrollView(
                    child: LoginActions(),
                  ),
                ),
        ],
      ),
    );
  }
}
