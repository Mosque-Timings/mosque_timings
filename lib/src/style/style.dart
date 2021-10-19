import 'package:flutter/material.dart';

class AppStyle {
  roundDialog(double radius) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)));
  }

  tabBarDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(5)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey[400]!,
          blurRadius: 2,
        )
      ],
    );
  }

  btnBgColor() {
    return Colors.blueGrey.shade50;
  }

  primaryColor() {
    return Colors.lightBlue.shade500;
  }

  dialogShape(double radius) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)));
  }

  contBoxDecor(double radius,
      {double borderWidth = 0, Color color = Colors.white}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(
        Radius.circular(radius),
      ),
      border: Border.all(
        color: Colors.blueGrey.shade50,
        width: borderWidth,
      ),
    );
  }
}
