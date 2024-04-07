import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,

      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),

      title: Text('App',style: TextStyle(color: Colors.white),),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.search,color: Colors.white,), // Replace icon1 with the desired icon
          onPressed: () {
            // Add functionality for the first icon
          },
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart, color: Colors.white,), // Replace icon2 with the desired icon
          onPressed: () {
            // Add functionality for the second icon
          },
        ),
      ],


    );
  }
}