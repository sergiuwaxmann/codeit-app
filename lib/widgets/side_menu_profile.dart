import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:codeitapp/providers/auth_notifier.dart';
import 'package:codeitapp/utilities/size_config.dart';

class SideMenuProfile extends StatelessWidget {
  final Function onTap;

  const SideMenuProfile({
    Key key,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            radius: !SizeConfig.isTablet ? 20 : 30,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Provider.of<AuthNotifier>(context, listen: false).name,
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(fontSize: 2 * SizeConfig.textMultiplier),
              ),
              SizeConfig.isPortrait
                  ? SizedBox(
                      height: 5,
                    )
                  : SizedBox.shrink(),
              SizeConfig.isPortrait
                  ? Text(
                      'License ends on 01 Jan, 2021',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontSize: 1.5 * SizeConfig.textMultiplier),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
