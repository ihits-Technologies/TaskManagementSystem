import 'package:flutter/material.dart';
import 'package:tms/services/api_authentication/auth_api_services.dart'; // Ensure this import is correct
import '../../../../common_widgets/login_screen/textfield.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? onTap;
  const LoginScreen({Key? key, this.onTap}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  void login(BuildContext context) async {
    try {
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please enter both username and password.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      final response = await _authService.loginUser(
        _emailController.text,
        _passwordController.text,
      );

      if (response['Code'] == 1) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User verification failed: ${response['Message']}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
                    obscureText: false,
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  height: 60,
                  width: 320,
                  child: Textfield(
                    controller: _passwordController,
                    hintText: "Password",
                    obscureText: true,
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
