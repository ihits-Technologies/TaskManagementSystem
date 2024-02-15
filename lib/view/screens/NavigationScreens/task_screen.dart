// TaskScreen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/app_colors/app_colors.dart';
import 'package:tms/text_styles/text_styles.dart';
import 'package:tms/view/screens/HomeScreen/assigned_Task_Screen/AssignedTasks.dart';

import '../HomeScreen/home_screen_components/announcements_box.dart';
import '../HomeScreen/home_screen_components/task_box.dart';


class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => const AssignedScren());
                },
                child: TaskBox(
                  title: "Assigned",
                  pendingPercentage: 30,
                  overduePercentage: 20,
                  completedPercentage: 50,
                  totalTasks: 25,
                  headingStyle: TextStyles.secondaryTitle,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {},
                child: TaskBox(
                  title: "Received",
                  completedPercentage: 20,
                  pendingPercentage: 40,
                  overduePercentage: 40,
                  totalTasks: 25,
                  headingStyle: TextStyles.secondaryTitle,
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {},
                child: AnnouncementsBox(
                  headingStyle: TextStyles.secondaryTitle,
                  title: "Announcements",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
