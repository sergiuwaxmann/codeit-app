import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

class ProfileSection extends StatelessWidget {
  final String title;

  const ProfileSection({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
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
    );
  }
}
