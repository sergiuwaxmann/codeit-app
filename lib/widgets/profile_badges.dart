import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

class ProfileBadges extends StatelessWidget {
  final List<String> _badges = [
    'badge-01.png',
    'badge-02.png',
    'badge-03.png',
    'badge-04.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Badges',
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(fontSize: 2 * SizeConfig.textMultiplier),
            ),
            Row(
              children: [
                Text(
                  'See all',
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 1.8 * SizeConfig.textMultiplier,
                      ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black.withOpacity(0.6)
                      : Colors.white.withOpacity(0.6),
                ),
              ],
            ),
          ],
        ),
        Container(
          height: (SizeConfig.isPortrait ? 0.1 : 0.2) * SizeConfig.screenHeight,
          child: ListView.builder(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: _badges.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                  right: index != _badges.length - 1
                      ? 0.025 *
                          (SizeConfig.isPortrait
                              ? SizeConfig.screenWidth
                              : SizeConfig.screenHeight)
                      : 0,
                ),
                child: Image.asset('assets/badges/${_badges[index]}'),
              );
            },
          ),
        ),
      ],
    );
  }
}
