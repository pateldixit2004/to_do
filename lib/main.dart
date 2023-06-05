import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/screen/view/home_screen.dart';
import 'package:to_do/screen/view/view_screen.dart';
void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(p0) =>HomeScreen(),
        '/view':(p0) =>viewScreen(),
      },
    )
  );
}