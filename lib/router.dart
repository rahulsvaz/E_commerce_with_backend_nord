


import 'package:flutter/material.dart';
import 'package:shopping_cart_with_node/features/authentication/view/auth_screen.dart';
import 'package:shopping_cart_with_node/features/BottomNavBar/view/botttom_nav_bar.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
        
      );
    case BottomNavigationBarMain.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomNavigationBarMain(),
      );

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
