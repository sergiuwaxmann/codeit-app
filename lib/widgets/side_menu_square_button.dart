import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

class SideMenuSquareButton extends StatelessWidget {
  final IconData icon;
  final Color color1, color2;

  const SideMenuSquareButton({
    Key key,
    @required this.icon,
    @required this.color1,
    @required this.color2,
  }) : super(key: key);

  double _calculateSize() {
    double sizeMultiplier = !SizeConfig.isTablet ? 0.1 : 0.05;
    return sizeMultiplier *
        (SizeConfig.isPortrait
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight);
  }

  @override
  Widget build(BuildContext context) {
    double _size = _calculateSize();

    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color1,
            color2,
          ],
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
