import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luccelo_app/database/getTeadyBears.dart';
import 'package:luccelo_app/myapp/sample_home.dart';
import 'package:luccelo_app/myapp/screen/authentication/login_page.dart';
import 'package:luccelo_app/myapp/screen/authentication/register_page.dart';
import 'package:luccelo_app/myapp/screen/authentication/success.dart';
import 'package:luccelo_app/myapp/screen/contact_page.dart';
import 'package:luccelo_app/myapp/screen/main_page.dart';
import 'package:provider/provider.dart';

import 'database/count.dart';
import 'database/getDreamCatcher.dart';
import 'database/getGiftPacks.dart';
import 'firebase_options.dart';
import 'myapp/screen/checkout_page.dart';
import 'myapp/screen/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
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
        ChangeNotifierProvider<Count>(
          create: (context) => Count(),
        ),
      ],
      builder: (BuildContext context, Widget) {
        return SafeArea(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: const ColorScheme.light(
                background: Color(0xFFf9f1f9),
                onBackground: Color(0xFF171717),
                primary: Color(0xFF962b9a),
                secondary: Color(0xFF41468a),
                onPrimary: Colors.white,
                shadow: Color(0xFF2291fd),
              ),
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => LoginPage(),
              '/register': (context) => RegisterPage(),
              '/contactPage': (context) => ContactUsPage(),
              '/main': (context) => MainPage(),
              '/samplePage': (context) => SampleHomePage(),
              '/homePage': (context) => HomePage(),
              '/checkoutPage': (context) => Checkout(),
              '/success': (context) => Success(),
              // '/test': (context) => test(),
            },
          ),
        );
      },

    );
  }
}
//
// class test extends StatelessWidget {
//   const test({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: TextButton(
//           onPressed: () async {
//             Order order = Order();
//             String productId = "q23 2";
//             String count = "u9u";
//             await order.order();
//             print("meka nm hari ");
//           },
//           child: Text('click'),
//         ),
//       ),
//     );
//   }
// }
