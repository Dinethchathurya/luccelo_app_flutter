import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luccelo_app/myapp/sample_home.dart';
import 'package:luccelo_app/myapp/screen/authentication/login_page.dart';
import 'package:luccelo_app/myapp/screen/authentication/register_page.dart';
import 'package:luccelo_app/myapp/screen/contact_page.dart';
import 'package:luccelo_app/myapp/screen/main_page.dart';

import 'firebase_options.dart';
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
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/contactPage': (context) => ContactUsPage(),
          '/main': (context) => MainPage(),
          '/order': (context) => OrderPage(),
          '/samplePage': (context) => SampleHomePage(),
        },
      ),
    );
  }
}
