import 'package:flutter/material.dart';

import '../../colors/appColors.dart';
import '../../common/circulat_shape/circular_design_container.dart';
import '../../common/dropDownButton/dropdown.dart';
import '../../common/text_form_colum/text_field_coulum.dart';

class OrderPage extends StatefulWidget {
  final String? email; // Email of the logged-in user

  const OrderPage({Key? key, this.email}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  /*backend part for contact us page.I get user email from login data and set contact us page to auto fill*/
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  // List for pickup method
  List<String> pickupMethod = [
    'Pickup at Store',
    'Home Delivery',
  ];
  //list for payment method
  List<String> paymentMethod = [
    'payment method 1',
    'payment method 3',
    'payment method 3'
  ];

  // Variable to hold the selected value
  String? selectedShippingmethod;
  String? selectedpaymentMethod;

  @override
  Widget build(BuildContext context) {
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    double price = 6000.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF404690),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              )),
        ],
      ),
      backgroundColor: AppColors.appBackgroundColor,
      body: SingleChildScrollView(
        child: CircularDesignContainer(
          pageTitle: 'CHECKOUT',
          pageSubTitle: '',
          formHeight: mediaqueryHeight * .7,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                SizedBox(
                  height: mediaqueryWidth * .1,
                ),
                TextFieldColum(
                  textLable: 'Shoping Address',
                  hintText: 'Enter your Address',
                  controller: _addressController,
                  maxlines: 3,
                ),
                SizedBox(
                  height: mediaqueryWidth * .04,
                ),
                CommonDropDown(
                    selectedValue: pickupMethod[0],
                    items: pickupMethod,
                    onChanged: (value) {
                      selectedShippingmethod = value;
                    },
                    textLable: 'Shipping Method'),
                SizedBox(
                  height: mediaqueryWidth * .04,
                ),
                CommonDropDown(
                    selectedValue: paymentMethod[0],
                    items: paymentMethod,
                    onChanged: (value) {
                      selectedpaymentMethod = value;
                    },
                    textLable: 'Payment Method'),
                SizedBox(
                  height: mediaqueryWidth * .04,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'EST.TOTAL',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Rs $price',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mediaqueryWidth * .8,
                  child: ElevatedButton(
                    //elevated button is a type of a buttons.Icreate common button can use everywhere
                    style: ElevatedButton.styleFrom(
                      //style button
                      backgroundColor: const Color(0xFF404690),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Place Order', //this is text of buttton
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
