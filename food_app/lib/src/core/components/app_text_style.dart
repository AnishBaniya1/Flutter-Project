import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle name() {
    return TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle heading() {
    return TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle subheading() {
    return TextStyle(
      color: Colors.black38,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }
}
