import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/features/authentication/screens/splash_screen/splash_screen.dart';

import 'controllers/taskBox_controller/taskBoxController.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize TaskBoxController
    Get.put(TaskBoxController());

    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      home: SplashScreen(),
    );
  }
}
