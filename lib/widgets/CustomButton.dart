import 'package:flutter/material.dart';
import 'package:investmentmanager/Providers/AuthProvider.dart';
import 'package:investmentmanager/utils/ColorConstants.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  void Function()? onPressed;
  Widget? child;
  CustomButton({super.key, this.onPressed, this.child});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Container(
      height: 44,
      width: 180,
      decoration: BoxDecoration(
          color: ColorConstants().primary,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: ElevatedButton.styleFrom(
          elevation: 0.5,
        ),
      ),
    );
  }
}
