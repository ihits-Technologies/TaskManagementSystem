// rafshii orginal ui/////////////////////1234567890

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/view/screens/HomeScreen/home_screen.dart';
import 'package:tms/view/screens/Launching_screens/OTPScreen.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import 'commonWidgets/textfield.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController companyIDController = TextEditingController();
  TextEditingController userIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    final String companyID = companyIDController.text;
    final String userID = userIDController.text;
    final String password = passwordController.text;

    final response =
        await http.post(Uri.parse('http://server_ip/login'), body: {
      'comapanyID': companyID,
      'userID': userID,
      'password': password,
    });

  }

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
                    image: const AssetImage(tRectangleFlip1),
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
              child: const Image(
                fit: BoxFit.contain,
                height: 100,
                width: 100,
                image: AssetImage(tLexPlan),
              ),
            ),
            const SizedBox(
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
            const SizedBox(
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
            const SizedBox(
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
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                if (companyIDController.text.isEmpty ||
                    userIDController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: const Text('Please fill in all fields.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK'),
                            )
                          ],
                        );
                      });
                }

                Get.to(const HomeScreen());
              },
              style: ElevatedButton.styleFrom(
                  elevation: 3,
                  backgroundColor: tPrimaryColor,
                  foregroundColor: tTextWhite,
                  fixedSize: const Size(320, 30),
                  shape: const StadiumBorder()),
              child: const Text(tLogin),
            ),
            const SizedBox(
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







