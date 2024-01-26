import 'package:flutter/material.dart';
import 'package:shopping_cart_with_node/common/global_variables/global_variables.dart';
import 'package:shopping_cart_with_node/common/widgets/sized_box.dart';
import 'package:shopping_cart_with_node/features/Home/view/widgets/below_app_bar.dart';
import 'package:shopping_cart_with_node/features/Home/view/widgets/top_buttons.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          //app bar
          child: AppBar(
            title: Row(
              children: [
                Image.asset(
                  'assets/images/amazon_in.png',
                  height: height * 0.03,
                ),
                Container(
                  padding: EdgeInsets.only(left: width * 0.44),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_outlined),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      ),
                    ],
                  ),
                )
              ],
            ),
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
          ),
        ),
        body:const  Column(
          children: <Widget>[
            
            BelowAppBar(),
           SizedBox10(),
            TopButtons()
           
            ],
        ));
  }
}
