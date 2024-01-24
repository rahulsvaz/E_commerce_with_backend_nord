// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_with_node/features/authentication/viewModel/user_provider.dart';
import 'package:shopping_cart_with_node/common/global_variables/global_variables.dart';
import 'package:shopping_cart_with_node/features/homeScreen/viewModel/home_screen_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //int _page = 0;
  double bottomNavbarWidth = 42;
  double bottomBarBorderWidth = 5;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final home = Provider.of<HomeScreeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      bottomNavigationBar:
      
      Consumer<HomeScreeProvider>(builder: (context, value, child) => 
      
       BottomNavigationBar(
        onTap: (selectedIndex) {
         home.setPage(selectedIndex);

        },
        currentIndex: home.pages,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        items: [
          
          BottomNavigationBarItem(
            label: 'Home',
            icon: Container(
              width: bottomNavbarWidth,
              decoration: BoxDecoration(
                  border: 
                  
                  
                   Border(
                      top: BorderSide(
                          color: home.pages == 0
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor))),
              child: const Icon(Icons.home),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: Container(
              width: bottomNavbarWidth,
              decoration: BoxDecoration(
                border:  Border(
                  top: BorderSide(
                      color: home.pages == 1
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor),
                ),
              ),
              child: const Icon(Icons.shopping_cart),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Container(
              width: bottomNavbarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: home.pages == 2
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor),
                ),
              ),
              child: const Icon(Icons.account_circle_rounded),
            ),
          )
        ],
      ),
    ));
  }
}
