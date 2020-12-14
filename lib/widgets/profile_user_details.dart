import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

class ProfileUserDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color(0xFF00AEFF),
                Color(0xFF0075FF),
              ],
            ),
            borderRadius: BorderRadius.circular(42),
          ),
          child: Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Theme.of(context).highlightColor,
              borderRadius: BorderRadius.circular(42),
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'),
              radius: SizeConfig.isTablet || SizeConfig.isPortrait ? 25 : 20,
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sergiu',
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(fontSize: 2.2 * SizeConfig.textMultiplier),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'License ends on 01 Jan, 2021',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(fontSize: 1.8 * SizeConfig.textMultiplier),
            ),
          ],
        ),
      ],
    );
  }
}
