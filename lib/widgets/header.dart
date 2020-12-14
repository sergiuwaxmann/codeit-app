import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/header_square_button.dart';
import 'package:codeitapp/widgets/search_field.dart';

class Header extends StatelessWidget {
  final sideMenuAnimation;

  const Header({
    Key key,
    @required this.sideMenuAnimation,
  }) : super(key: key);

  double _calculateMargin() {
    double sizeMultiplier = !SizeConfig.isTablet ? 0.05 : 0.025;
    return sizeMultiplier *
        (SizeConfig.isPortrait
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight);
  }

  @override
  Widget build(BuildContext context) {
    double _margin = _calculateMargin();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HeaderSquareButton(
          onTap: sideMenuAnimation,
        ),
        SearchField(),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: _margin,
          ),
          child: Icon(
            Icons.notifications,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed('/profile'),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.jpg'),
            radius: !SizeConfig.isTablet ? 18 : 22,
          ),
        ),
      ],
    );
  }
}
