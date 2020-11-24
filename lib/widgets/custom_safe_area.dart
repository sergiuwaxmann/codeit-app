import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

class CustomSafeArea extends StatelessWidget {
  final bool left, right, top, bottom;
  final Alignment alignment;
  final Widget child;

  const CustomSafeArea({
    Key key,
    this.left = true,
    this.right = true,
    this.bottom = true,
    this.top = true,
    this.alignment = Alignment.center,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: Container(
        alignment: alignment,
        margin: EdgeInsets.all(
          0.05 *
              (SizeConfig.isPortrait
                  ? SizeConfig.screenWidth
                  : SizeConfig.screenHeight),
        ),
        child: child,
      ),
    );
  }
}
