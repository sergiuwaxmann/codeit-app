import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

class LoginAlertDialog extends StatelessWidget {
  final String body;

  const LoginAlertDialog({
    Key key,
    @required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).highlightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      title: Text(
        'Login Error',
        style: Theme.of(context)
            .textTheme
            .headline1
            .copyWith(fontSize: 2.2 * SizeConfig.textMultiplier),
      ),
      content: Text(
        body,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontSize: 2 * SizeConfig.textMultiplier),
      ),
      actions: <Widget>[
        Container(
          margin: EdgeInsets.only(
            bottom: 16,
            right: 16,
          ),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Text(
              'Close',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 2 * SizeConfig.textMultiplier,
                    color: Theme.of(context).accentColor,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
