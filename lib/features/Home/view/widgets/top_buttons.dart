import 'package:flutter/material.dart';
import 'package:shopping_cart_with_node/common/widgets/sized_box.dart';
import 'package:shopping_cart_with_node/features/Home/view/widgets/account_button.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              callBack: () {},
              label: 'Your Orders',
            ),
               AccountButton(
              callBack: () {},
              label: 'Turn Seller',
            )
          ],
        ),SizedBox10(),
         Row(
          children: [
            AccountButton(
              callBack: () {},
              label: 'Log Out',
            ),
               AccountButton(
              callBack: () {},
              label: 'Your WishList',
            )
          ],
                 )
      ],
    );
  }
}
