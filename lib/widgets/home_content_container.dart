import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

class HomeContentContainer extends StatelessWidget {
  final Widget child;

  const HomeContentContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 0.05 * SizeConfig.screenHeight,
      ),
      child: child,
    );
  }
}
