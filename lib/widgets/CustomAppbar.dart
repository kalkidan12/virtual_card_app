import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomAppbar extends StatelessWidget {
  Color? bgColor;
  Widget? title;
  Widget? leading;
  List<Widget>? actions;
  CustomAppbar(
      {super.key, this.title, this.actions, this.leading, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      backgroundColor: bgColor,
      title: title,
      leading: leading,
      actions: actions,
    );
  }
}
