import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_with_node/common/global_variables/global_variables.dart';
import 'package:shopping_cart_with_node/features/authentication/viewModel/user_provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(gradient: GlobalVariables.appBarGradient),
      child: RichText(
        text: TextSpan(
            text: 'Hello ',
            style: const TextStyle(color: Colors.black, fontSize: 22),
            children: [
              TextSpan(
                text: user.user.name,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              )
            ]),
      ),
    );
  }
}
