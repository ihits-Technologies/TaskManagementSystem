import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/view/screens/HomeScreen/home_screen.dart';
import 'package:tms/view/screens/Launching_screens/splash_screen.dart';

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
      home: SplashScreen(),
    );
  }
}
