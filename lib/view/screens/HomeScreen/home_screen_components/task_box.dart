import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/view/screens/HomeScreen/home_screen_components/pie_chart_indicator.dart';
import 'package:tms/view/screens/HomeScreen/home_screen_components/dot_indicator.dart';

import '../../../../controller/taskBox_controller/taskBoxController.dart';

class TaskBox extends StatelessWidget {
  final String title;
  final double completedPercentage;
  final double pendingPercentage;
  final double overduePercentage;
  final TextStyle headingStyle;
  final int totalTasks;

  TaskBox({
    required this.title,
    required this.completedPercentage,
    required this.pendingPercentage,
    required this.overduePercentage,
    required this.headingStyle,
    required this.totalTasks,
  });

  @override
  Widget build(BuildContext context) {
    TaskBoxController controller = Get.find<TaskBoxController>();

    return GetBuilder<TaskBoxController>(
      init: controller,
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,

              style: headingStyle,
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PieChartIndicator(
                    completedPercentage: completedPercentage,
                    pendingPercentage: pendingPercentage,
                    overduePercentage: overduePercentage,
                    totalTasks: totalTasks,
                    // Pass totalTasks
                  ),
                  SizedBox(width: 1),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          DotIndicator(color: controller.completedColor.value),
                          SizedBox(width: 8),
                          Text("Completed   ${completedPercentage.toInt()}%"),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          DotIndicator(color: controller.pendingColor.value),
                          const SizedBox(
                            width: 8,
                          ),
                          Text("Pending        ${pendingPercentage.toInt()}%"),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          DotIndicator(color: controller.overdueColor.value),
                          const SizedBox(width: 8),
                          Text("Overdue        ${overduePercentage.toInt()}%"),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
