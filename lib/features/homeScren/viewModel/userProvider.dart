
import 'package:flutter/material.dart';
import 'package:shopping_cart_with_node/model/user_model.dart';

class UserProvider extends ChangeNotifier{

   User _user =User(id: '', email: '', password: '', name: '', address: '', type: '', token: '');


  User get user => _user;

  setUser (String user){
    _user = User.fromJson(user);
    notifyListeners();
  } 
}