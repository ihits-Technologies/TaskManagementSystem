import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNumber;

  OTPScreen({required this.phoneNumber});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OTPScreen> {
  final TextEditingController _otpController = TextEditingController();
  String _verificationId = '';

  @override
  void initState() {
    super.initState();
    _verifyPhoneNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify OTP'),
        backgroundColor: Color(0xFF4FC9AC), // Match login screen color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter the 6-digit code sent to ${widget.phoneNumber}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            PinCodeTextField(
              appContext: context,
              length: 6,
              controller: _otpController,
              onChanged: (pin) {},
              onCompleted: (pin) {
                _verifyOtp(pin);
              },
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline,
                activeFillColor: Colors.grey[200],
                inactiveFillColor: Colors.grey[200],
                selectedFillColor: Colors.grey[300],
                inactiveColor: Colors.grey,
                activeColor: Color(0xFF4FC9AC), // Match login screen color
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () => _resendOtp(),
              child: Text('Resend OTP'),
            ),
          ],
        ),
      ),
    );
  }

  void _verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.phoneNumber,
      verificationCompleted: (credential) async {
        // Automatic verification, sign in user
        try {
          await FirebaseAuth.instance.signInWithCredential(credential);
          // Handle successful login
          Navigator.pop(context); // Navigate back to login screen
        } catch (e) {
          // Handle any errors
        }
      },
      verificationFailed: (error) {
        // Handle verification failure
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      },
      codeSent: (verificationId, resendToken) {
        setState(() {
          _verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (verificationId) {
        // Handle timeout
      },
    );
  }

  void _verifyOtp(String otp) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: otp,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      // Handle successful login (you can navigate to a different screen)
      Navigator.pop(context); // Navigate back to login screen
    } catch (e) {
      // Handle verification error
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  void _resendOtp() {
    _verifyPhoneNumber();
  }
}
