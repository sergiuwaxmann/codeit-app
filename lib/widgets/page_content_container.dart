import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

class PageContentContainer extends StatelessWidget {
  final Widget child;
  final bool bottomMargin;

  const PageContentContainer({
    Key key,
    @required this.child,
    this.bottomMargin = false,
  }) : super(key: key);

  double _calculateTopMargin() {
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
        top: _calculateTopMargin(),
        bottom: bottomMargin ? 0.05 * SizeConfig.screenHeight : 0,
      ),
      child: child,
    );
  }
}
