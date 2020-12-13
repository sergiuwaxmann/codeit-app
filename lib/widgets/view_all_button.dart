import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

class ViewAllButton extends StatelessWidget {
  final Function onTap;

  const ViewAllButton({
    Key key,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: (!SizeConfig.isTablet ? 0.2 : 0.12) *
            (SizeConfig.isPortrait
                ? SizeConfig.screenWidth
                : SizeConfig.screenHeight),
        height: (!SizeConfig.isTablet ? 0.1 : 0.06) *
            (SizeConfig.isPortrait
                ? SizeConfig.screenWidth
                : SizeConfig.screenHeight),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            Theme.of(context).brightness == Brightness.light
                ? BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 16,
                    color: Colors.black.withOpacity(0.2),
                  )
                : BoxShadow(),
          ],
        ),
        child: Text(
          'View all',
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: 1.8 * SizeConfig.textMultiplier,
                color: Colors.black,
              ),
        ),
      ),
    );
  }
}
