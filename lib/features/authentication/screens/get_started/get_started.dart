import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tms/features/authentication/screens/login_screen/login_screen.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';
import '../../../../view/screens/HomeScreen/home_screen.dart';


class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {





    // Check if the user is logged in
    void checkAuthentication() {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          // User is signed in, navigate to the HomeScreen
          Get.off(() => HomeScreen());
        } else {
          // User is not signed in, navigate to the LoginScreen
          Get.off(() => LoginScreen());
        }
      });
    }

    // Call the authentication check method when the widget is built
    WidgetsBinding.instance!.addPostFrameCallback((_) => checkAuthentication());

    final scrHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final screenHeight = (scrHeight - statusBarHeight);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [

            Center(
              child: Container(

                width: screenWidth/5,
                padding: EdgeInsets.only(bottom: screenWidth * 0.4),

                child: Center(
                  child: Image(
                    fit: BoxFit.contain,
                    image: const AssetImage(tLexPlan),
                  ),
                ),
              ),
            ),
            // Column for bottom-left rectangle
            Column(
              children: [
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
              ],
            ),
            // Column for bottom-right rectangle
            Column(
              children: [
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
              ],
            ),
            // Positioned elements for text and button
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
  }
}
