import 'package:flutter/material.dart';
import 'package:tms/app_colors/app_colors.dart';
import 'package:tms/view/screens/HomeScreen/home_screen_components/pie_chart_indicator.dart';

import 'dot_indicator.dart';

class TaskBox extends StatelessWidget {
  final String title;
  final double completedPercentage;
  final double pendingPercentage;
  final double overduePercentage;
  final TextStyle headingStyle;

  TaskBox({
    required this.title,
    required this.completedPercentage,
    required this.pendingPercentage,
    required this.overduePercentage,
    required this.headingStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: headingStyle,
        ),
        SizedBox(height: 10), ///// Space b/w the titles. Assigned,Recived,....//
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PieChartIndicator(
                completedPercentage: completedPercentage,
                pendingPercentage: pendingPercentage,
                overduePercentage: overduePercentage,
              ),
              SizedBox(width: 1),////// Space beetween piechart and Text column//// /
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      DotIndicator(color: AppColors.completedColor),
                      SizedBox(width: 8),
                      Text("Completed   ${completedPercentage.toInt()}%"),
                    ],
                  ),
                  // Text("${completedPercentage.toInt()}%"),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      DotIndicator(color: AppColors.pendingColor),
                      SizedBox(width: 8,),
                      Text("Pending        ${pendingPercentage.toInt()}%"),
                    ],
                  ),
                  // Text("${pendingPercentage.toInt()}%"),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      DotIndicator(color: AppColors.overdueColor),
                      SizedBox(width: 8),
                      Text("Overdue        ${overduePercentage.toInt()}%"),
                    ],
                  ),
                  // Text("${overduePercentage.toInt()}%"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
