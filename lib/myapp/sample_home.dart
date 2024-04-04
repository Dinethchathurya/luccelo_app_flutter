import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../common/button/button.dart';

class SampleHomePage extends StatelessWidget {
  const SampleHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user =
        FirebaseAuth.instance.currentUser; //create a user using login data
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Welcome ${user!.email}'), //get user email using user that create above
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/contactPage');
                },
                child: const Text('Contact Us')),
            SubmitButton(
                text: 'Logout',
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, '/');
                })
          ],
        ),
      ),
    );
  }
}
