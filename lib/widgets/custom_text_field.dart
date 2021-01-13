import 'dart:io';

import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final IconData icon, cupertinoIcon;
  final String hint;
  final bool obscureText;
  final Function validator, onSaved, onFieldSubmitted;

  const CustomTextField({
    Key key,
    @required this.textInputType,
    @required this.textInputAction,
    @required this.icon,
    @required this.cupertinoIcon,
    @required this.hint,
    this.obscureText = false,
    @required this.validator,
    @required this.onSaved,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: TextFormField(
        autocorrect: false,
        enableSuggestions: false,
        obscureText: obscureText ? true : false,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        cursorColor: Theme.of(context).accentColor,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontSize: 1.8 * SizeConfig.textMultiplier),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          prefixIcon: Icon(
            Platform.isIOS ? cupertinoIcon : icon,
            color: Color(0xFF5488F1),
          ),
          hintText: hint,
          border: InputBorder.none,
          errorStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                fontSize: 1.5 * SizeConfig.textMultiplier,
                color: Colors.red.withOpacity(0.8),
              ),
        ),
        validator: validator,
        onSaved: onSaved,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}
