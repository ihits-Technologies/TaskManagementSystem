import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import 'controllers/splashScreen_contoller.dart';



class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    final scrHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    //final appbarHeight = appbar.preferredsize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final screenHeight = (scrHeight - statusBarHeight);
    splashController.startAnimate();

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Obx(
                  () => AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                top: 2,
                bottom: splashController.animate.value ? 20 : -200,
                left: 20,
                right: 20,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1400),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: const SizedBox(
                    height: 30,
                    width: 30,
                    child: Image(
                      alignment: FractionalOffset.center,
                      fit: BoxFit.none,
                      image: AssetImage(tCompanyLogoAnim),
                    ),
                  ),
                ),
              ),
            ),

            // Positioned(
            //   top: 20,
            //   bottom: 50,
            //   child: Image(
            //     image: AssetImage(tCompanyLogo),
            //   ),
            // ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomLeft,
                child: Image(
                  width: screenWidth,
                  fit: BoxFit.fitWidth,
                  image: AssetImage(tRectangle1),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomRight,
                child: Image(
                  width: screenWidth,
                  fit: BoxFit.fitWidth,
                  image: const AssetImage(tRectangle2),
                ),
              ),
            ),
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
            const Align(
              alignment: FractionalOffset.bottomCenter,
              child: Image(
                height: 80,
                width: 100,
                image: AssetImage(tCompanyLogo),
              ),
            )
          ],
        ),
      ),
    );
  }
}