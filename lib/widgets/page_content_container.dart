import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

class PageContentContainer extends StatelessWidget {
  final Widget child;

  const PageContentContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  double _calculateMargin() {
    double sizeMultiplier = !SizeConfig.isTablet ? 0.1 : 0.05;
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
      ),
      child: child,
    );
  }
}
