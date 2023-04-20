import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  TextInputType? keyboardType;
  String? Function(String?)? validator;
  bool enabled;
  bool readOnly;
  bool obscureText;
  CustomInput(
      {super.key,
      required this.controller,
      required this.enabled,
      this.keyboardType,
      required this.obscureText,
      required this.readOnly,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 2)
      ]),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        textAlign: TextAlign.start,
        readOnly: readOnly,
        obscureText: obscureText,
        obscuringCharacter: '*',
        validator: validator,
        enabled: enabled,
        decoration: InputDecoration(border: InputBorder.none),
      ),
    );
  }
}
