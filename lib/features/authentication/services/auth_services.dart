import 'dart:developer';

import 'package:shopping_cart_with_node/global_variables/global_variables.dart';
import 'package:shopping_cart_with_node/model/user_model.dart';
import 'package:http/http.dart' as http;

class AuthServices {
// Sign up user

  void signUpUser({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      User user = User(
          id: '',
          email: email,
          password: password,
          name: name,
          address: '',
          type: '',
          token: '');

      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-type': 'application/json;charset=UTF-8'

            /*    Here, we are defining a Map to represent the headers of 
                  an HTTP request. In Dart, HTTP headers are often 
                  represented as a Map with keys and values, where both the 
                  keys and values are strings. */
          });
      log(res.body);
    } catch (e) {
      log(e.toString());
    }
  }
}
