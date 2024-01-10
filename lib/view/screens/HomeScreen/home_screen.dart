// home_screen.dart

import 'package:flutter/material.dart';
import 'package:tms/app_colors/app_colors.dart';
import 'package:tms/text_styles/text_styles.dart';
import 'package:tms/view/screens/HomeScreen/assigned_Task_Screen/AssignedTasks.dart';
import 'home_screen_components/task_box.dart';
import 'home_screen_components/announcements_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            size: 40,
            color: AppColors.selectedColor,
          ), // Use the Menu icon for the hamburger icon
          color: Colors.black,
          onPressed: () {
            // Handle the onPressed event (e.g., open the drawer)
          },
        ),
        centerTitle: true,
        title: const Text("Task", style: TextStyles.PrimaryTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            color: Colors.black,
            onPressed: () {
              // Handle profile button click
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AssignedScren()));
              },
              child: TaskBox(
                title: "Assigned",

                pendingPercentage: 30,
                overduePercentage: 20,
                completedPercentage: 50,
                headingStyle: TextStyles.secondaryTitle, // Updated this line
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
                headingStyle: TextStyles.secondaryTitle, // Updated this line
              ),
            ),
            // const SizedBox(height: 16),
            // GestureDetector(
            //   child: Expanded(
            //     child: AnnouncementsBox(
            //       headingStyle: TextStyles.secondaryTitle, // Updated this line
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: (){

              },
              child: AnnouncementsBox(
                headingStyle: TextStyles.secondaryTitle,
                title: "Announcements",
              ),
            )
            // GestureDetector(
            //     onTap: () {},
            //     child: Expanded(
            //       child: AnnouncementsBox(
            //         headingStyle: TextStyles.secondaryTitle,
            //         title: "Announcements",
            //       ),
            //     ))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 1.0),
          ),
        ),
        child: BottomNavigationBar(
          selectedItemColor:
              AppColors.selectedColor, // Change the selected item color
          unselectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.task),
              label: 'Task',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_file),
              label: 'Attachments',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.send),
              label: 'Actions',
            ),
          ],
        ),
      ),
    );
  }
}
