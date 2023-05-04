
  import 'package:flutter/material.dart';

import '../constants.dart';

ThemeData theme() {
    return ThemeData(
     scaffoldBackgroundColor: Colors.white,
     fontFamily: "Muli",
     appBarTheme:  const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.black),
     ),
     inputDecorationTheme: inputDecorationTheme(),
       
     textTheme: const TextTheme(
      bodyText1:TextStyle(color : kTextColor),
      bodyText2:TextStyle(color : kTextColor),
       ),
     visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
  InputDecorationTheme inputDecorationTheme (){
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
             borderSide: BorderSide(color: kTextColor),
             gapPadding: 10,
            );
    return InputDecorationTheme(
      contentPadding: 
            EdgeInsets.symmetric(horizontal: 42 , vertical: 20),
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            border: outlineInputBorder,
    );
  }