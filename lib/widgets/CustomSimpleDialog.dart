import 'package:flutter/material.dart';

class CustomDialog {
  static Future<void> showSimpleDialog(
      BuildContext context, String title, List<Widget>? children) async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(title: Text(title), children: children);
        });
  }
}
