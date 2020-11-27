import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

class CustomSafeArea extends StatelessWidget {
  final Alignment alignment;
  final Widget child;

  const CustomSafeArea({
    Key key,
    this.alignment = Alignment.center,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
