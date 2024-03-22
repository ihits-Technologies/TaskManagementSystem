import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class Textfield extends StatelessWidget
{

final String labelText ;
final String hintText;

Textfield({
  required this.labelText,
  required this.hintText,

});

@override
  Widget build(BuildContext context) {
  return
    TextField(
      decoration: InputDecoration(
        labelText: labelText,
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