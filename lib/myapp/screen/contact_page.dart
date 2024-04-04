import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../colors/appColors.dart';
import '../../common/button/button.dart';
import '../../common/circulat_shape/circular_design_container.dart';
import '../../common/text_form_colum/text_field_coulum.dart';

class ContactUsPage extends StatefulWidget {
  final String? email =
      FirebaseAuth.instance.currentUser?.email; // Email of the logged-in user

  ContactUsPage({Key? key}) : super(key: key);

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  /*backend part for contact us page.I get user email from login data and set contact us page to auto fill*/
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Autofill email field with user's email if available
    _emailController.text = widget.email ?? '';
  }

  Future<void> contactUs() async {
    try {
      // Send message and show success dialog
      await sendMessage(
        _fullNameController.text.trim(),
        _emailController.text.trim(),
        _messageController.text.trim(),
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Successfully sent message to admin'),
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
    } catch (e) {
      // Show error dialog if sending message fails
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to send message. Error: $e'),
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

  Future<void> sendMessage(
      String fullName, String email, String message) async {
    // Send message to Firestore
    await FirebaseFirestore.instance.collection('contactus').add({
      'full name': fullName,
      'email': email,
      'message': message,
    });
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    _emailController.dispose();
    _fullNameController.dispose();
    _messageController.dispose();
    super.dispose();
  }

// end of backend part
  @override
  Widget build(BuildContext context) {
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    final mediaqueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: SingleChildScrollView(
        child: CircularDesignContainer(
          pageTitle: 'Contact Us',
          pageSubTitle: 'You have an issue. You can contact us',
          formHeight: mediaqueryHeight * .8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                SizedBox(
                  height: mediaqueryWidth * .1,
                ),
                TextFieldColum(
                  textLable: 'Full Name',
                  hintText: 'Enter Your Name',
                  controller: _fullNameController,
                ),
                SizedBox(
                  height: mediaqueryWidth * .02,
                ),
                TextFieldColum(
                  textLable: 'Email',
                  hintText: 'Enter Your Email',
                  controller: _emailController,
                ),
                SizedBox(
                  height: mediaqueryWidth * .02,
                ),
                TextFieldColum(
                  textLable: 'Message',
                  hintText: 'Enter Your Message',
                  maxlines: 5,
                  controller: _messageController,
                ),
                SizedBox(
                  height: mediaqueryWidth * .02,
                ),
                SubmitButton(
                  text: 'SEND MESSAGE',
                  onTap: contactUs,
                ),
                TextButton(
                  onPressed: () {
                    // Navigate back to the home page
                    Navigator.pushNamed(context, '/samplePage');
                  },
                  child: const Text(
                    'Back to Home page',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 155, 155, 155),
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
