import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:codeitapp/utilities/size_config.dart';

class SearchField extends StatelessWidget {
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

    return Expanded(
      child: Container(
        height: _size,
        margin: EdgeInsets.only(
          left: _size / 2,
        ),
        // padding: EdgeInsets.symmetric(
        //   horizontal: 16,
        // ),
        decoration: BoxDecoration(
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
          borderRadius: BorderRadius.circular(14),
        ),
        child: TextField(
          enabled: false,
          autocorrect: false,
          enableSuggestions: false,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          cursorColor: Theme.of(context).accentColor,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(fontSize: 1.8 * SizeConfig.textMultiplier),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              // ! Probably not the best practice
              top: !SizeConfig.isTablet ? 7 : 5,
            ),
            prefixIcon: Icon(
              Platform.isIOS ? CupertinoIcons.search : Icons.search,
              size: 2 * SizeConfig.textMultiplier,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
            ),
            hintText: !SizeConfig.isTablet && SizeConfig.isPortrait
                ? 'Search'
                : 'Search for courses',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
