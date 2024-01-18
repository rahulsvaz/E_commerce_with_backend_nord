
import 'package:flutter/material.dart';
import 'package:shopping_cart_with_node/features/authentication/screens/auth_screen.dart';

class AuthScreenProvider with ChangeNotifier {
  Auth auth = Auth.SignUp;

  changeAuth(Auth value) {
    auth = value;
    notifyListeners();
  }

 
}
