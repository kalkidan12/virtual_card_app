import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:investmentmanager/utils/ColorConstants.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  TextInputType? keyboardType;
  String? Function(String?)? validator;
  bool readOnly;
  bool obscureText;
  void Function()? onPressed;
  IconData? prefixIcon;
  IconData? suffixIcon;
  String? hintText;

  CustomInput(
      {super.key,
      required this.controller,
      this.keyboardType,
      required this.obscureText,
      required this.readOnly,
      this.validator,
      this.onPressed,
      this.prefixIcon,
      this.suffixIcon,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(7),
      decoration:
          BoxDecoration(color: Color.fromARGB(255, 243, 243, 243), boxShadow: [
        BoxShadow(
            color: Color.fromARGB(255, 240, 240, 240),
            offset: Offset(0, 1),
            blurRadius: 1,
            spreadRadius: 1)
      ]),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        textAlign: TextAlign.start,
        readOnly: readOnly,
        obscureText: obscureText,
        obscuringCharacter: '*',
        validator: validator,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            hintText: hintText,
            border: InputBorder.none,
            prefixIcon: Icon(
              prefixIcon,
              size: 25,
              color: ColorConstants().primary,
            ),
            suffixIcon: IconButton(
                onPressed: onPressed,
                icon: Icon(
                  suffixIcon,
                  size: 25,
                  color: ColorConstants().primary,
                ))),
      ),
    );
  }
}
