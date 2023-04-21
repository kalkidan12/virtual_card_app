import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  String text;
  double? fontSize;
  FontWeight? fontWeight;
  Color? color;
  TextDecoration? decoration;
  CustomText(
      {super.key,
      required this.text,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          decoration: decoration,
          decorationThickness: 1.5,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color),
    );
  }
}
