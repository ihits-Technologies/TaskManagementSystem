// TaskScreen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/view/screens/HomeScreen/assigned_Task_Screen/AssignedTasks.dart';
import 'package:tms/view/screens/received_task/received_task.dart';
import 'package:tms/view/screens/task_assigned/task_assigned.dart';

import '../../../constants/text_styles/text_styles.dart';
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
                  Get.to(() =>  Assigned());
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
                onTap: () {
                  Get.to(() => ReceivedTaskStep());
                },
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
