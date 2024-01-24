// ignore_for_file: use_build_context_synchronously
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_with_node/common/constants/error_handling.dart';
import 'package:shopping_cart_with_node/common/constants/utils.dart';
import 'package:shopping_cart_with_node/features/homeScreen/view/home_screen.dart';
import 'package:shopping_cart_with_node/features/authentication/viewModel/user_provider.dart';
import 'package:shopping_cart_with_node/common/global_variables/global_variables.dart';
import 'package:shopping_cart_with_node/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
// sign in function
// here we are not passing user instance thats why we are using json encoder
  signInUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            'Content-type': 'application/json;charset=UTF-8'
          });

      httpErrorHandling(
          response: res,
          context: context,
          onSuccess: () async {
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            SharedPreferences pref = await SharedPreferences.getInstance();
            await pref.setString('x-auth-token', jsonDecode(res.body)['token']);
            Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.routeName, (route) => false);
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
// Sign up user

  void signUpUser(
      {required String email,
      required String name,
      required String password,
      required BuildContext context}) async {
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

      httpErrorHandling(
          response: res,
          context: context,
          onSuccess: () {
            showSnackbar(context,
                'Account Has Been Created You Can Login With Same Credentials');
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  /// get user data

  getUserData(BuildContext context) async {
    try {
     SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
//
    }
  }
}
