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

  const TaskBox({super.key,
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
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white24,
                border: Border.all(color: Colors.white24),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  )
                ]
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
                  const SizedBox(width: 1),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          DotIndicator(color: controller.completedColor.value),
                          const SizedBox(width: 8),
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
                      const SizedBox(height: 15),
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
