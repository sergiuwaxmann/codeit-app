import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

class PrimarySmallButton extends StatelessWidget {
  final String text;
  final Function onTap;

  const PrimarySmallButton({
    Key key,
    @required this.text,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 0.3 * SizeConfig.screenWidth,
        // height: 0.12 * SizeConfig.screenWidth,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15,
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF73A0F4),
              Color(0xFF4A47F5),
            ],
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: 2 * SizeConfig.textMultiplier,
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
