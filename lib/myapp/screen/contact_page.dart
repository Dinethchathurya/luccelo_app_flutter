import 'package:flutter/material.dart';

import '../../colors/appColors.dart';
import '../../common/button/button.dart';
import '../../common/circulat_shape/circular_design_container.dart';
import '../../common/input_field.dart';
import '../../database/contactus.dart';

class ContactUsPage extends StatelessWidget {
  ContactUsPage({Key? key}) : super(key: key);

  late String name = "nithu";
  late String enterEmail = "nithu123@gmil.com";
  late String message = "helo kjjkh";
  late String email = "nithu123@gmil.com";

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
                Center(
                  child: Text(
                    'Send Your Message',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaqueryWidth * .1,
                ),
                InputField(
                    hintText: 'Enter Your Name',
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.text_fields),
                    onChanged: (String value) {
                      name = value;
                      print(name);
                    }),
                SizedBox(
                  height: mediaqueryWidth * .04,
                ),
                InputField(
                    hintText: 'Enter Your Email',
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    onChanged: (String value) {
                      enterEmail = value;
                      print(enterEmail);
                    }),
                SizedBox(
                  height: mediaqueryWidth * .04,
                ),
                InputField(
                    hintText: 'Enter Your Message',
                    labelText: 'Message',
                    prefixIcon: Icon(Icons.message),
                    onChanged: (String value) {
                      message = value;
                      print(message);
                    }),
                SizedBox(
                  height: mediaqueryWidth * .04,
                ),
                SubmitButton(
                  text: 'SEND MESSAGE',
                  onTap: () {
                    Contactus contact = Contactus();
                    contact.contactus(message, email, name);
                  },
                ),
                TextButton(
                  onPressed: () {
                    // Navigate back to the home page
                    Navigator.pushNamed(context, '/home');
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
