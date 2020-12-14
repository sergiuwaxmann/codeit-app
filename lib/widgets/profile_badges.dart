import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/profile_section.dart';

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
        ProfileSection(
          title: 'Badges',
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
