import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:codeitapp/utilities/size_config.dart';

class HeaderSquareButton extends StatelessWidget {
  final Function onTap;

  const HeaderSquareButton({
    Key key,
    @required this.onTap,
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

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: _size,
        height: _size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            14,
          ),
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Theme.of(context).highlightColor,
          boxShadow: [
            Theme.of(context).brightness == Brightness.light
                ? BoxShadow(
                    offset: Offset(0, 12),
                    blurRadius: 16,
                    color: Colors.black.withOpacity(0.2),
                  )
                : BoxShadow(),
          ],
        ),
        child: SvgPicture.asset(
          Theme.of(context).brightness == Brightness.light
              ? 'assets/icons/menu.svg'
              : 'assets/icons/menu-dark.svg',
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
