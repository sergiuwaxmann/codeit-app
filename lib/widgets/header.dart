import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/header_square_button.dart';
import 'package:codeitapp/widgets/search_field.dart';

class Header extends StatelessWidget {
  double _calculateNotificationsMargin() {
    double sizeMultiplier = !SizeConfig.isTablet ? 0.05 : 0.025;
    return sizeMultiplier *
        (SizeConfig.isPortrait
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight);
  }

  @override
  Widget build(BuildContext context) {
    double _notificationsMargin = _calculateNotificationsMargin();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HeaderSquareButton(
          onTap: () => {},
        ),
        SearchField(),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: _notificationsMargin,
          ),
          child: Icon(
            Icons.notifications,
          ),
        ),
        // TODO: Add GestureDetector (Avatar)
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/profile.jpg'),
          radius: !SizeConfig.isTablet ? 18 : 22,
        ),
      ],
    );
  }
}
