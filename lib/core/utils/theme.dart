import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData darkTheme=ThemeData(
  primaryColor: AppColor.kPrimaryColor1,
  scaffoldBackgroundColor:AppColor.kPrimaryColor1 ,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor:AppColor.kPrimaryColor1 ,
        statusBarIconBrightness: Brightness.light),
    backgroundColor: AppColor.kPrimaryColor1,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor:AppColor.kPrimaryColor1,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor:AppColor.kPrimaryColor1,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor:AppColor.kPrimaryColor1 ,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),

);
ThemeData lightTheme=ThemeData(
  primaryColor: AppColor.kPrimaryColor1 ,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor:AppColor.kPrimaryColor1 ,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColor.kPrimaryColor1 ,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),

);