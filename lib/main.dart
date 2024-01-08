import 'package:flutter/material.dart';
import 'package:shopping_cart_with_nord/global_variables/global_variables.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
home: Scaffold(body: Column
  (children: [
    ElevatedButton(onPressed: (){}, child: Text(''))
],),),
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: GlobalVariables.secondaryColor
        ),
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
            appBarTheme: AppBarTheme(elevation: 0,iconTheme: IconThemeData(
              color: Colors.black
            ))

      ),

    );
  }
}
