// import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:codeitapp/utilities/encryption.dart';
import 'package:codeitapp/utilities/http_exception.dart';

class AuthNotifier with ChangeNotifier {
  String _idUser;
  String _email, _name;

  String get idUser {
    return decryptAES(_idUser);
  }

  String get email {
    return decryptAES(_email);
  }

  String get name {
    return decryptAES(_name);
  }

  bool get isLoggedIn {
    return _idUser != null;
  }

  Future<void> login(String email, String password) async {
    final encryptedEmail = encryptAES(email);
    final url = 'https://www.sickode.com/APIs/codeit/login.php?access=@SKWD/SW';

    try {
      final response = await http.post(
        url,
        body: {
          'email': encryptedEmail,
          'password': '${encryptAES(password)}',
        },
      );
      final jsonData = json.decode(response.body);

      if (jsonData['status'] == 404) {
        throw HttpException(jsonData['message']);
      } else if (jsonData['status'] == 403) {
        throw HttpException(jsonData['message']);
      } else {
        _idUser = jsonData['id'];
        _email = encryptedEmail;
        _name = jsonData['name'];

        notifyListeners();

        final prefs = await SharedPreferences.getInstance();
        final userData = jsonEncode(
          {
            'id': _idUser,
            'email': _email,
            'name': _name,
          },
        );
        prefs.setString('userData', userData);
      }
    } catch (error) {
      throw error;
    }
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }

    final extractedUserData =
        jsonDecode(prefs.getString('userData')) as Map<String, Object>;
    _idUser = extractedUserData['id'];
    _email = extractedUserData['email'];
    _name = extractedUserData['name'];

    // ! We can check license end date here

    notifyListeners();

    return true;
  }

  Future<void> logout() async {
    _idUser = null;
    _email = null;
    _name = null;

    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
  }
}
