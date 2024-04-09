import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../../../../common_widgets/login_screen/textfield.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';
import '../../../../services/auth/auth_services.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? onTap;
  const LoginScreen({Key? key, this.onTap}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void login(BuildContext context) async {
    final authService = AuthService();

    try {
      // Validate email and password inputs
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please enter both email and password.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Sign in the user with email and password
      await authService.signInWithEmailPassword(
        _emailController.text,
        _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuthException
      print('Failed with error code: ${e.code}');
      print(e.message);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Authentication Failed'),
          content: Text(e.message ?? 'An error occurred.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final scrHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final screenHeight = (scrHeight - statusBarHeight);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
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
                  alignment: Alignment.bottomCenter,
                  child: Image(
                    fit: BoxFit.contain,
                    height: 100,
                    width: 100,
                    image: AssetImage(tLexPlan),
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 60,
                  width: 320,
                  child: Textfield(
                    controller: _emailController,
                      hintText: "Email",
                      obscureText: false

                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  height: 60,
                  width: 320,
                  child: Textfield(
                    controller: _passwordController,
                      hintText: "Password",
                      obscureText: true


                  ),
                ),
                SizedBox(height: 8),
                Builder(
                  builder: (context) => ElevatedButton(
                    onPressed: () => login(context),
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      backgroundColor: tPrimaryColor,
                      foregroundColor: tTextWhite,
                      fixedSize: const Size(320, 30),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(tLogin),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  tPowered,
                  style: TextStyle(
                    fontSize: 12,
                    color: tTextPoweredby,
                  ),
                ),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Image(
                    height: 50,
                    width: 100,
                    image: AssetImage(tCompanyLogo),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
