import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

import 'package:codeitapp/providers/auth_notifier.dart';

import 'package:codeitapp/utilities/form_validator.dart';
import 'package:codeitapp/utilities/http_exception.dart';
import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/custom_safe_area.dart';
import 'package:codeitapp/widgets/custom_text_field.dart';
import 'package:codeitapp/widgets/login_alert_dialog.dart';
import 'package:codeitapp/widgets/primary_small_button.dart';

class LoginActions extends StatefulWidget {
  @override
  _LoginActionsState createState() => _LoginActionsState();
}

class _LoginActionsState extends State<LoginActions> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;

  bool _isFormValid = true;

  Future<void> _trySubmit() async {
    _isFormValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (_isFormValid) {
      _formKey.currentState.save();
      await _login(_email, _password);
      if (Provider.of<AuthNotifier>(context, listen: false).isLoggedIn) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    }
  }

  Future<void> _login(String email, String password) async {
    try {
      await Provider.of<AuthNotifier>(context, listen: false)
          .login(email, password);
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed.';
      if (error.toString().contains('User not found') ||
          error.toString().contains('Wrong password'))
        errorMessage = 'Incorrect email or password.';
      _showDialog(errorMessage);
    } catch (error) {
      _showDialog('Authentication failed. Please try again later.');
    }
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LoginAlertDialog(
          body: message,
        );
      },
      barrierColor: Colors.black.withOpacity(0.25),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 0.05 * SizeConfig.screenWidth,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Log in to",
              style: Theme.of(context).textTheme.headline1.copyWith(
                    fontSize: 3 * SizeConfig.textMultiplier,
                  ),
            ),
            Text(
              "Start Learning",
              style: Theme.of(context).textTheme.headline1.copyWith(
                    fontSize: 3 * SizeConfig.textMultiplier,
                    color: Color(0xFF5B4CF0),
                  ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: !_isFormValid ? 10 : 0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                color: Theme.of(context).brightness == Brightness.light
                    ? Color(0xFFFAFCFF)
                    : Theme.of(context).highlightColor,
                boxShadow: [
                  Theme.of(context).brightness == Brightness.light &&
                          SizeConfig.isPortrait
                      ? BoxShadow(
                          offset: Offset(0, 12),
                          blurRadius: 16,
                          color: Colors.black.withOpacity(0.2),
                        )
                      : BoxShadow(),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      icon: Icons.mail,
                      cupertinoIcon: CupertinoIcons.mail_solid,
                      hint: "Email",
                      validator: (value) => FieldValidator.validateEmail(value),
                      onSaved: (value) => _email = value.trim(),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ),
                    CustomTextField(
                      obscureText: true,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.go,
                      icon: Icons.lock,
                      cupertinoIcon: CupertinoIcons.lock_fill,
                      hint: "Password",
                      validator: (value) =>
                          FieldValidator.validatePassword(value),
                      onSaved: (value) => _password = value.trim(),
                      onFieldSubmitted: (_) => _trySubmit(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            PrimarySmallButton(
              text: "Log in",
              onTap: _trySubmit,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    print("Email: waxmann.sergiu@me.com");
                    print("Password: codeitpass");
                  },
                  child: Text(
                    "Forgot password?",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 2 * SizeConfig.textMultiplier,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Color(0xFF1B1E9C).withOpacity(0.4)
                                  : Colors.white.withOpacity(0.8),
                        ),
                  ),
                ),
                GestureDetector(
                  onTap: () => {},
                  child: Text(
                    "Sign up",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 2 * SizeConfig.textMultiplier,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Color(0xFF1B1E9C).withOpacity(0.4)
                                  : Colors.white.withOpacity(0.8),
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
