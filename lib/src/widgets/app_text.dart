import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AppText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color color;

  const AppText({
    Key? key,
    this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!.tr,
      textAlign: TextAlign.center,
      // overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
