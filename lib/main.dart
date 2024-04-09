import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/auth/auth_gate.dart';
import 'package:tms/features/authentication/controllers/splash_screen_controller.dart';
import 'package:tms/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:tms/firebase_options.dart';

import 'controllers/taskBox_controller/taskBoxController.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TaskBoxController());

    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      home: SplashScreen()
    );
  }
}
