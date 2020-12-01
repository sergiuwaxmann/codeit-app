import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

class ExploreHeadline extends StatelessWidget {
  double _calculateMargin() {
    double sizeMultiplier = !SizeConfig.isTablet ? 0.05 : 0.025;
    return sizeMultiplier *
        (SizeConfig.isPortrait
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: _calculateMargin(),
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
