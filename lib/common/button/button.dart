import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final mediaqueryWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: mediaqueryWidth * .8,
      child: ElevatedButton(

        //elevated button is a type of a buttons.Icreate common button can use everywhere
        style: ElevatedButton.styleFrom(
          //style button
          backgroundColor: const Color.fromARGB(255, 253, 176, 138),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50))),

        ),
        onPressed: onTap,
        child: Text(
          text, //this is text of buttton
          style: const TextStyle(
              fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}
