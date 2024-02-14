import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_with_node/features/authentication/viewModel/user_provider.dart';

class AddressBar extends StatelessWidget {
  const AddressBar({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      height: height * 0.05,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 114, 226, 221),
          Color.fromARGB(255, 162, 236, 233),
        ], stops: [
          0.5,
          1.0
        ]),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(Icons.location_on_outlined),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('Deliver to ${user.name} - ${user.address}',style: const TextStyle(fontWeight: FontWeight.w500,overflow:TextOverflow.ellipsis ),),
            ),
          ),
          const Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
}
