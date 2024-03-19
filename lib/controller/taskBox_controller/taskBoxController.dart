import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../app_colors/app_colors.dart';

class TaskBoxController extends GetxController {
  Rx<Color> completedColor = AppColors.completedColor.obs;
  Rx<Color> pendingColor = AppColors.pendingColor.obs;
  Rx<Color> overdueColor = AppColors.overdueColor.obs;

  void updateColors({
    required Color newCompletedColor,
    required Color newPendingColor,
    required Color newOverdueColor,
  }) {
    completedColor.value = newCompletedColor;
    pendingColor.value = newPendingColor;
    overdueColor.value = newOverdueColor;
  }
}
