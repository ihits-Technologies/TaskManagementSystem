import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class Textfield extends StatelessWidget
{
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final FocusNode? focusNode;

Textfield({
  super.key,
  required this.controller,
  required this.hintText,
  required this.obscureText,
  this.focusNode

});



@override
  Widget build(BuildContext context) {
  return
    TextField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      decoration: InputDecoration(

        labelStyle: TextStyle(
            color: tPrimaryColor
        ),
        isDense: true,
        hintText: hintText,
        hintStyle: TextStyle(color: tTextFieldIconColor),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(width: 1, color: tTextFieldFocussedBlkColor),
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: tPrimaryColor),
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
      ),
    );
  }
}