import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import 'login_screen.dart';



class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    final scrHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    //final appbarHeight = appbar.preferredsize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final screenHeight = (scrHeight - statusBarHeight);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Expanded(
              child: Align(
                alignment: FractionalOffset.center,
                child: Image(
                  fit: BoxFit.none,
                  width: screenWidth,
                  image: const AssetImage(tCompanyLogoAnim),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomLeft,
                child: Image(
                  fit: BoxFit.fitWidth,
                  width: screenWidth,
                  image: AssetImage(tRectangle1),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomRight,
                child: Image(
                  fit: BoxFit.fitWidth,
                  width: screenWidth,
                  image: const AssetImage(tRectangle2),
                ),
              ),
            ),
            Positioned(
              bottom: 110,
              left: 55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tLet1,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    tLet2,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    tLet3,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              child: Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.1,
                  right: screenWidth * 0.1,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint('ElevatedButton Clicked');
                    Get.to(LoginScreen());
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 3,
                      foregroundColor: tPrimaryColor,
                      fixedSize: const Size(320, 30),
                      shape: const StadiumBorder()),
                  child: const Text(tBtnGetStart),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    //);
  }
}