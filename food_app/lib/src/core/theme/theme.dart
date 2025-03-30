import 'package:flutter/material.dart';
import 'package:food_app/src/core/resources/resource.dart';

class AppTheme {
  static ThemeData theme = ThemeData(fontFamily: AppFont.poppins);
}

//Explanation
// What this does: It makes sure your entire app uses the Poppins font by default.

// Why this is useful: Instead of manually setting 
//fontFamily: 'Poppins' in every Text widget, this applies it to the whole app.