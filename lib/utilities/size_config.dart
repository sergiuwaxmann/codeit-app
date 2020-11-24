import 'package:flutter/widgets.dart';

class SizeConfig {
  static double screenWidth, screenHeight, textMultiplier;
  static bool isPortrait, isTablet;

  void calc(BoxConstraints constraints, Orientation orientation) {
    screenWidth = constraints.maxWidth;
    screenHeight = constraints.maxHeight;
    isPortrait = orientation == Orientation.portrait;
    isTablet = screenWidth >= 1024 || screenHeight >= 1024;
    textMultiplier = screenHeight /
        100 *
        (isPortrait
            ? 1
            : isTablet
                ? 1.5
                : 2);
  }
}
