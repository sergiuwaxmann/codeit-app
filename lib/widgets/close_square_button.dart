import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

class CloseSquareButton extends StatelessWidget {
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
      onTap: () => Navigator.pop(context),
      child: Container(
        width: _size,
        height: _size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            14,
          ),
          color: Color(0xFF242629).withOpacity(0.8),
        ),
        child: Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    );
  }
}
