import 'package:flutter/material.dart';
import 'package:shopping_cart_with_node/common/global_variables/global_variables.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            title: Row(children: [],),
            flexibleSpace: Container(
              decoration:
                const   BoxDecoration(gradient: GlobalVariables.appBarGradient),

            ),
          ),),
      backgroundColor: Colors.amber,
      body: const Center(
        child: Text('Account Screen'),
      ),
    );
  }
}
