import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

class RecentsHeadline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Recents',
          style: Theme.of(context)
              .textTheme
              .headline1
              .copyWith(fontSize: 2.8 * SizeConfig.textMultiplier),
        ),
        SizeConfig.isPortrait
            ? SizedBox(
                height: 5,
              )
            : SizedBox.shrink(),
        Text(
          '3 New Courses, More Coming',
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(fontSize: 1.8 * SizeConfig.textMultiplier),
        ),
      ],
    );
  }
}
