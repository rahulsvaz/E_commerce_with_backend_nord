import 'package:flutter/material.dart';
import 'package:shopping_cart_with_node/features/authentication/screens/auth_screen.dart';
import 'package:shopping_cart_with_node/features/homeScreen/view/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AuthScreen());
case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const HomeScreen());
          
          
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('The Page Not Available'),
          ),
        ),
      );
  }
}
