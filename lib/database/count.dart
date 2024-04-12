import 'package:flutter/cupertino.dart';

class Count extends ChangeNotifier {
  int quantity = 1;
  late int price = 12;
  late int pricee;

  incrementQuantity() {
    quantity++;
    pricee = price * quantity;
    notifyListeners();
  }

  decrementQuantity() {
    if (quantity > 1) {
      quantity--;
      pricee = price;
      notifyListeners();
    }
  }

  setPrice(String pricee) {
    price = int.parse(pricee);
    print('set price');
  }
}
