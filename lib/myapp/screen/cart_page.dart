import 'package:flutter/material.dart';
import 'package:luccelo_app/database/count.dart';
import 'package:provider/provider.dart';

import '../widgets/app_bar.dart';
import '../widgets/cart_list_card.dart';
import 'oder_page.dart';

class CartPage extends StatelessWidget {
  CartPage(
      {super.key,
      required this.name,
      required this.price,
      required this.image,
      required this.productId});
  var image;
  var name;
  var price;
  var productId;

  @override
  Widget build(BuildContext context) {
    var count = Provider.of<Count>(context).quantity;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: MyAppBar(
          name: 'Cart',
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: CartListCard(
              image: image,
              name: name,
              price: price,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderPage(
                    product_id: productId,
                    price: price,
                    count: count,
                  ),
                ),
              );
            },
            child: Text(
              'Proceed to Checkout',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            style: ElevatedButton.styleFrom(
                fixedSize: Size(250, 50), backgroundColor: Colors.yellow),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
