import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:tms/view/screens/HomeScreen/home_screen.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import 'commonWidgets/textfield.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scrHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    //final appbarHeight = appbar.preferredsize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final screenHeight = (scrHeight - statusBarHeight);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          //child: Container(
          //padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    Align(
                      alignment: FractionalOffset.topLeft,
                      child: Image(
                        fit: BoxFit.fitWidth,
                        width: screenWidth,
                        image: AssetImage(tRectangleFlip1),
                      ),
                    ),
                    Align(
                      alignment: FractionalOffset.topRight,
                      child: Image(
                        fit: BoxFit.fitWidth,
                        width: screenWidth,
                        image: const AssetImage(tRectangleFlip2),
                      ),
                    ),
                  ],
                ),
                Container(
                  //color: Colors.cyan,
                  alignment: Alignment.bottomCenter,
                  child: Image(
                    fit: BoxFit.contain,
                    height: 100,
                    width: 100,
                    image: AssetImage(tLexPlan),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 60,
                  width: 320,
                  child: Textfield(
                    labelText: "Company ID",
                    hintText: "Enter your Company ID",
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 60,
                  width: 320,
                  child: Textfield(
                    labelText: "User ID",
                    hintText: "Enter your User ID",
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 60,
                  width: 320,
                  child: Textfield(
                    labelText: "Password",
                    hintText: "Enter your Password",
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(HomeScreen());
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 3,
                      backgroundColor: tPrimaryColor,
                      foregroundColor: tTextWhite,
                      fixedSize: const Size(320, 30),
                      shape: const StadiumBorder()),
                  child: const Text(tLogin),
                ),
                SizedBox(
                  height: 5,
                ),
                const Text(
                  tPowered,
                  style: TextStyle(
                    fontSize: 12,
                    color: tTextPoweredby,
                  ),
                ),
                const Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Image(
                    height: 50,
                    width: 100,
                    image: AssetImage(tCompanyLogo),
                  ),
                )
              ],
            )

          // ),
        ),
      ),
    );
  }
}