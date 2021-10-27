import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shop/execptions/auth_exception.dart';

class Auth with ChangeNotifier {
  static const _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDiXfd-WtgmXORqEsZ3T5pcgT70DGniKAE';

  Future<void> _autehenticate(
      String email, String password, String urlFragment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlFragment?key=AIzaSyDiXfd-WtgmXORqEsZ3T5pcgT70DGniKAE';
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    final body = jsonDecode(response.body);
    if (body['error'] != null) {
      throw AuthException(body['error']['message']);
    }

    print(body);
  }

  Future<void> signup(String email, String password) async {
    return _autehenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _autehenticate(email, password, 'signInWithPassword');
  }
}
