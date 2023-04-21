import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomSizedbox extends StatelessWidget {
  double? height;
  double? width;
  double radius;
  double padding;
  Widget? child;
  Color? color;
  DecorationImage? image;
  CustomSizedbox({
    super.key,
    this.height,
    this.width,
    this.child,
    this.color,
    this.image,
    required this.radius,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          image: image,
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(radius))),
      child: SizedBox(
        height: height,
        width: width,
        child: child,
      ),
    );
  }
}
