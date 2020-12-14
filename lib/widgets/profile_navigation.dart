import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/profile_settings_square_button.dart';

class ProfileNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Platform.isIOS ? CupertinoIcons.back : Icons.arrow_back,
          ),
        ),
        Text(
          'Profile',
          style: Theme.of(context)
              .textTheme
              .headline1
              .copyWith(fontSize: 2 * SizeConfig.textMultiplier),
        ),
        ProfileSettingsSquareButton(),
      ],
    );
  }
}
