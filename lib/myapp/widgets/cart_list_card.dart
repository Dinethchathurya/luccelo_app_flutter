import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../database/count.dart';

class CartListCard extends StatefulWidget {
  CartListCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });
  var name;
  var price;
  var image;

  @override
  _CartListCardState createState() => _CartListCardState();
}

class _CartListCardState extends State<CartListCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage(
                              '${widget.image}',
                            ),
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.name}',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 25, // set the width
                                        height: 25,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red.withOpacity(0.2),
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.remove),
                                        onPressed: Provider.of<Count>(context,
                                                listen: false)
                                            .decrementQuantity(),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${Provider.of<Count>(context).quantity}',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 25, // set the width
                                        height: 25,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green.withOpacity(0.2),
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: Provider.of<Count>(context,
                                                listen: false)
                                            .incrementQuantity(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                '${widget.price}',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // ElevatedButton(
                          //   onPressed: () {
                          //     // Add to cart logic
                          //   },
                          //   child: Text('Add to Cart'),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
