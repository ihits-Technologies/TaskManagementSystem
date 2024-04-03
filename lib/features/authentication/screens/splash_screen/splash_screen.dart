import 'dart:async'; // Import Timer class

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/features/authentication/screens/get_started/get_started.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/splash_screen_controller.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    final scrHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final statusBarHeight = MediaQuery.of(context).padding.top;

    splashController.startAnimate();

    // Add a timer to delay navigation to the next screen
    Timer(Duration(seconds: 90), () {
      // Get.off(GetStarted());
    });

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Obx(
                  () => AnimatedPositioned(
                duration: const Duration(milliseconds: 900),
                top: 2,
                bottom: splashController.animate.value ? 20 : -200,
                left: 20,
                right: 20,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1400),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Center(
                      child: Container(
                        width: screenWidth* 0.3,
                        height: screenWidth*0.3,

                        child: Image(
                          alignment: FractionalOffset.center,
                          fit: BoxFit.fitHeight,
                          image: AssetImage(tLexPlan),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Image at bottom left
            Positioned(
              bottom: 0,
              left: 0,
              child: Image(
                width: screenWidth,
                fit: BoxFit.fitWidth,
                image: AssetImage(tRectangle1),
              ),
            ),

            // Image at bottom right
            Positioned(
              bottom: 0,
              right: 0,
              child: Image(
                width: screenWidth,
                fit: BoxFit.fitWidth,
                image: const AssetImage(tRectangle2),
              ),
            ),

            // Text at bottom center
            Positioned(
              bottom: 60,
              left: 20,
              right: 20,
              child: Text(
                tPowered,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),


            Positioned(
              bottom: 3,
              left: (screenWidth - 100) / 2,
              child: Image(
                height: 80,
                width: 100,
                image: AssetImage(tCompanyLogo),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
