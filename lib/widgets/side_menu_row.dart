import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/side_menu_square_button.dart';

import 'package:codeitapp/model/side_menu_item.dart';

class SideMenuRow extends StatelessWidget {
  final SideMenuItem sideMenuItem;
  final Function onTap;

  const SideMenuRow({
    Key key,
    @required this.sideMenuItem,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SideMenuSquareButton(
            icon: sideMenuItem.icon,
            color1: sideMenuItem.bgColor1,
            color2: sideMenuItem.bgColor2,
          ),
          SizedBox(
            width: SizeConfig.isPortrait
                ? 0.025 * SizeConfig.screenWidth
                : 0.025 * SizeConfig.screenHeight,
          ),
          Container(
            child: Text(
              sideMenuItem.title,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(fontSize: 1.8 * SizeConfig.textMultiplier),
            ),
          ),
        ],
      ),
    );
  }
}
