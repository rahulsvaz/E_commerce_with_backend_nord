import 'package:flutter/material.dart';
import 'package:shopping_cart_with_nord/features/authentication/screens/auth_screen.dart';
import 'package:shopping_cart_with_nord/global_variables/global_variables.dart';
import 'package:shopping_cart_with_nord/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings)=> genarateRoute(settings),
      home: AuthScreen(),
      theme: ThemeData(
        colorScheme:
            const ColorScheme.light(primary: GlobalVariables.secondaryColor),
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
    );
  }
}
