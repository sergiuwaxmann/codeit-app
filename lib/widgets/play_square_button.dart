import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:codeitapp/utilities/size_config.dart';

class PlaySquareButton extends StatelessWidget {
  double _calculateSize() {
    double sizeMultiplier =
        !SizeConfig.isTablet ? (SizeConfig.isPortrait ? 0.15 : 0.14) : 0.1;
    return sizeMultiplier *
        (SizeConfig.isPortrait
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight);
  }

  @override
  Widget build(BuildContext context) {
    double _size = _calculateSize();

    return Padding(
      padding: EdgeInsets.only(
        right: _size * 1.2,
      ),
      child: Container(
        width: _size,
        height: _size,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 16,
                color: Colors.black.withOpacity(0.2),
              ),
            ]),
        child: SvgPicture.asset(
          'assets/icons/play.svg',
        ),
      ),
    );
  }
}
