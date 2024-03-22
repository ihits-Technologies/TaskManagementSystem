import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/get_started/get_started.dart';


class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimate() async {
    await Future.delayed(
      Duration(milliseconds: 200),
    );
    animate.value = true;
    await Future.delayed(
      Duration(milliseconds: 1400),
    );
    Get.to(GetStarted());
    //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
