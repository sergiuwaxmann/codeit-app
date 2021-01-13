import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/custom_safe_area.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Lottie.asset(
              'assets/lotties/loading.json',
              width: SizeConfig.isPortrait
                  ? SizeConfig.screenWidth
                  : SizeConfig.screenHeight,
            ),
          ),
          CustomSafeArea(
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Loading',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(fontSize: 2 * SizeConfig.textMultiplier),
                ),
                SizedBox(
                  height: 15,
                ),
                LinearProgressIndicator(
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
