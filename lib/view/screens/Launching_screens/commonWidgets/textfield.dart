import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class Textfield extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller; // Define controller parameter

  Textfield({
    required this.labelText,
    required this.hintText,
    this.controller, // Update constructor to accept controller
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, // Use the provided controller
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: tPrimaryColor,
        ),
        isDense: true,
        hintText: hintText,
        hintStyle: const TextStyle(color: tTextFieldIconColor),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: tTextFieldFocussedBlkColor),
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: tPrimaryColor),
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
      ),
    );
  }
}
