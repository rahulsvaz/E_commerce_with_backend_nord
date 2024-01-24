// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_with_node/features/Home/view/home_screen.dart';
import 'package:shopping_cart_with_node/features/account_page/view/account_page.dart';
import 'package:shopping_cart_with_node/features/authentication/viewModel/user_provider.dart';
import 'package:shopping_cart_with_node/common/global_variables/global_variables.dart';
import 'package:shopping_cart_with_node/features/BottomNavBar/viewModel/bottom_nav_provider.dart';
import 'package:shopping_cart_with_node/features/cart_page/view/cart_screen.dart';

class BottomNavigationBarMain extends StatefulWidget {
  static const String routeName = '/home';
  const BottomNavigationBarMain({super.key});

  @override
  State<BottomNavigationBarMain> createState() => _BottomNavigationBarMainState();
}

class _BottomNavigationBarMainState extends State<BottomNavigationBarMain> {
  double bottomNavbarWidth = 42;
  double bottomBarBorderWidth = 5;
List<Widget> pages =[
  const HomeScreen(),
  const AccountPage(),
  const CartScreen()
];
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final home = Provider.of<BottomNavProvider>(context);

    return Scaffold(
      body: pages[home.pages],
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      bottomNavigationBar:
      
      Consumer<BottomNavProvider>(builder: (context, value, child) => 
      
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
            label: 'Account',
            icon: Container(
              width: bottomNavbarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: home.pages == 1
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor),
                ),
              ),
              child: const Icon(Icons.account_circle_rounded),
            ),
          ), BottomNavigationBarItem(
            label: 'Cart',
            icon: Container(
              width: bottomNavbarWidth,
              decoration: BoxDecoration(
                border:  Border(
                  top: BorderSide(
                      color: home.pages == 2
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor),
                ),
              ),
              child:  Badge.count(
                count: home.pages,
                child:  const Icon(Icons.shopping_cart)),
            ),
          ),
        ],
      ),
    ));
  }
}
