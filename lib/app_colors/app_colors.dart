import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const Color selectedColor = Color(0xFF4FC9AC);
  static const Color completedColor = Color(0xFF8CCD0E);
  static const Color pendingColor = Color(0xFFFFB358);
  static const Color overdueColor = Color(0xffEB0909);
  static const Color AppBarColor = Color(0xFF4FC9AC);
  static const Color announcementColor = Color(0xFF004C4C);

// ... other code

// Define the gradient
  static LinearGradient totalTasksGradiant = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xFFD6ABAB),
      const Color(0xFFF80808),
      const Color(0xFFF60909).withOpacity(0.0), // Transparent red
    ],
    stops: const [0.0, 0.05, 1.0],
  );

  static LinearGradient appbarGradiaent = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF4EA99E),
        Color(0xFF4FC9AC),
      ]);
}
