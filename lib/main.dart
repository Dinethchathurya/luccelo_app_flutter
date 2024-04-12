import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luccelo_app/database/getTeadyBears.dart';
import 'package:luccelo_app/myapp/sample_home.dart';
import 'package:luccelo_app/myapp/screen/authentication/login_page.dart';
import 'package:luccelo_app/myapp/screen/authentication/register_page.dart';
import 'package:luccelo_app/myapp/screen/contact_page.dart';
import 'package:luccelo_app/myapp/screen/main_page.dart';
import 'package:provider/provider.dart';

import 'database/getDreamCatcher.dart';
import 'database/getGiftPacks.dart';
import 'firebase_options.dart';
import 'myapp/screen/cart_page.dart';
import 'myapp/screen/checkout_page.dart';
import 'myapp/screen/home.dart';
import 'myapp/screen/oder_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TeddyBears>(
          create: (context) => TeddyBears(),
        ),
        ChangeNotifierProvider<GiftPacks>(
          create: (context) => GiftPacks(),
        ),
        ChangeNotifierProvider<DreamCatcher>(
          create: (context) => DreamCatcher(),
        ),
      ],
      builder: (BuildContext context, Widget) {
        return SafeArea(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: ColorScheme.light(
                background: Color(0xFFf9f1f9),
                onBackground: Color(0xFF171717),
                primary: Color(0xFF962b9a),
                secondary: Color(0xFF41468a),
                onPrimary: Colors.white,
                shadow: Color(0xFF2291fd),
              ),
            ),
            initialRoute: '/homePage',
            routes: {
              '/': (context) => LoginPage(),
              '/register': (context) => RegisterPage(),
              '/contactPage': (context) => ContactUsPage(),
              '/main': (context) => MainPage(),
              '/order': (context) => OrderPage(),
              '/samplePage': (context) => SampleHomePage(),
              '/homePage': (context) => HomePage(),
              '/cartPage': (context) => CartPage(),
              '/checkoutPage': (context) => Checkout(),
              '/test': (context) => test(),
            },
          ),
        );
      },
    );
  }
}

class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            TeddyBears teddyBears = TeddyBears();
            teddyBears.getTeddyBears();
            //
          },
          child: Text('click'),
        ),
      ),
    );
  }
}
