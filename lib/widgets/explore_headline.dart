import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

class ExploreHeadline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 15,
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        'Explore',
        style: Theme.of(context)
            .textTheme
            .headline1
            .copyWith(fontSize: 2.8 * SizeConfig.textMultiplier),
      ),
    );
  }
}
