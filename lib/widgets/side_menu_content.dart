import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:codeitapp/providers/auth_notifier.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/custom_safe_area.dart';
import 'package:codeitapp/widgets/side_menu_logout.dart';
import 'package:codeitapp/widgets/side_menu_profile.dart';
import 'package:codeitapp/widgets/side_menu_row.dart';
import 'package:codeitapp/widgets/side_menu_vertical_sized_box.dart';

import 'package:codeitapp/data/side_menu_data.dart';

import 'package:codeitapp/screens/login.dart';

class SideMenuContent extends StatelessWidget {
  final Function hideSideMenuFunction;

  const SideMenuContent({
    Key key,
    this.hideSideMenuFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (SizeConfig.isPortrait ? 0.75 : 0.35) * SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
        ),
      ),
      child: CustomSafeArea(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // ? Is it necessary?
          children: [
            SideMenuProfile(
              onTap: () => Navigator.of(context).pushNamed('/profile'),
            ),
            SizeConfig.isPortrait
                ? SizedBox(
                    height: 0.16 * SizeConfig.screenWidth,
                  )
                : Spacer(),
            SideMenuRow(
              sideMenuItem: sideMenuItemsData[0],
              onTap: () => {},
            ),
            SideMenuVerticalSizedBox(),
            SideMenuRow(
              sideMenuItem: sideMenuItemsData[1],
              onTap: () => {},
            ),
            SideMenuVerticalSizedBox(),
            SideMenuRow(
              sideMenuItem: sideMenuItemsData[2],
              onTap: () => {},
            ),
            SideMenuVerticalSizedBox(),
            SideMenuRow(
              sideMenuItem: sideMenuItemsData[3],
              onTap: () {
                hideSideMenuFunction();
                Navigator.of(context).pushNamed('/settings');
              },
            ),
            Spacer(),
            SideMenuLogout(
              onTap: () async {
                await Provider.of<AuthNotifier>(context, listen: false)
                    .logout();
                Navigator.of(context)
                    .pushReplacementNamed(LoginScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
