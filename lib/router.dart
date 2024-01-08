import 'package:flutter/material.dart';
import 'package:shopping_cart_with_nord/features/authentication/screens/auth_screen.dart';


Route<dynamic> genarateRoute (RouteSettings routeSettings){
  switch (routeSettings.name){

    case AuthScreen.routeName:

      return MaterialPageRoute(
          settings: routeSettings,
          builder:(_)=> const AuthScreen());
    default:
      return
      MaterialPageRoute(
        settings: routeSettings,
        builder:(_)=> const Scaffold(body: Center(child: Text('The Page Not Available'),),));

  }


}

