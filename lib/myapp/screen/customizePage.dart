import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../colors/appColors.dart';
import '../../../common/circulat_shape/circular_design_container.dart';
import '../../database/customize.dart';

class CoustomizePage extends StatefulWidget {
  const CoustomizePage({Key? key});

  @override
  State<CoustomizePage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<CoustomizePage> {
  var category;
  var description;

  // Controllers for handling user input
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _birthDayController = TextEditingController();

  // Function to handle user sign-up
  Future<void> signIn() async {
    try {
      // Create user with email and password
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Add user details to Firestore database
      await addUser(
        _fullNameController.text.trim(),
        _emailController.text.trim(),
        _birthDayController.text.trim(),
      );
      await FirebaseAuth.instance.signOut();
      // Navigate to login page after successful registration
      Navigator.pushNamed(context, '/');
    } catch (e) {
      // Display error message in a popup if sign-up fails
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to register user. Error: $e'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  // Function to add user details to Firestore database
  Future<void> addUser(String fullName, String email, String birthDay) async {
    await FirebaseFirestore.instance.collection('users').add({
      'full name': fullName,
      'email': email,
      'birthDay': birthDay,
    });
  }

  // Dispose controllers when the widget is disposed
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();
    _birthDayController.dispose();
    super.dispose();
  }

  // Build method to create the UI
  @override
  Widget build(BuildContext context) {
    // Get screen size
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    final mediaqueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: SingleChildScrollView(
        child: CircularDesignContainer(
          pageTitle: 'Customized',
          pageSubTitle: 'Customize  your order',
          formHeight: mediaqueryHeight * .45,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Category',
                    hintText: 'Enter Category',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onChanged: (String value) {
                    category = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your Category";
                    }
                    String emailRegExp = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                    RegExp regExp = RegExp(emailRegExp);
                    if (!regExp.hasMatch(value)) {
                      return "Enter a valid Category";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: 'Enter Description',
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onChanged: (String value) {
                    description = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your Description";
                    }
                    String emailRegExp = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                    RegExp regExp = RegExp(emailRegExp);
                    if (!regExp.hasMatch(value)) {
                      return "Enter a Description";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    //elevated button is a type of a buttons.Icreate common button can use everywhere
                    style: ElevatedButton.styleFrom(
                      //style button
                      backgroundColor: const Color.fromARGB(255, 253, 176, 138),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                    ),
                    onPressed: () async {
                      Customize customize = Customize();
                      customize.customize(category, description);
                      Navigator.pushNamed(context, '/homePage');
                    },
                    child: Text(
                      'Submit', //this is text of buttton
                      style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
