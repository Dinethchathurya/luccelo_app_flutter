import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/app_bar.dart';
import '../widgets/cart_list_card.dart';
import '../widgets/my_drawer.dart';
import '../widgets/product_list_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: MyAppBar(),
        ),
        body: Column(
          children: [
            SizedBox(height: 20,),
            Expanded(
              child: CartListCard(),
            ),
          ],
        ));
  }
}
