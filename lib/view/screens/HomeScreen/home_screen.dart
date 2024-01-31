import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/app_colors/app_colors.dart';
import 'package:tms/text_styles/text_styles.dart';
import 'package:tms/view/screens/HomeScreen/assigned_Task_Screen/AssignedTasks.dart';
import 'package:tms/view/screens/actions_screen.dart';
import 'home_screen_components/task_box.dart';
import 'home_screen_components/announcements_box.dart';

class HomeScreen extends StatelessWidget {
  final RxInt _selectedIndex = 0.obs;

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white70,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppColors.appbarGradiaent
          ),
        ),
        // backgroundColor: AppColors.AppBarColor,
        leading: IconButton(
          icon: const Icon(
            Icons.menu_sharp,

            size: 40,
            color: AppColors.announcementColor,
          ),
          onPressed: () {
            // Handle the onPressed event (e.g., open the drawer)
          },
        ),
        // centerTitle: true,
        title: const Text("Tasks", style: TextStyles.PrimaryTitle),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(
                    () => const AssignedScren(),
                    // arguments: anyArgumentsYouWantToPass, // Uncomment if you want to pass arguments
                  );
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
              const SizedBox(height: 16),
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
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 1.0),
          ),
        ),
        child: Obx(
          () => BottomNavigationBar(
            selectedItemColor: AppColors.selectedColor,
            unselectedItemColor: Colors.grey,
            currentIndex: _selectedIndex.value,
            onTap: (index) {
              _selectedIndex.value = index;
              // You can perform additional actions when tapping on the bottom navigation bar items
              switch (index) {
                case 0:
                  // Handle 'Task' tab
                  break;
                case 1:
                  Get.to(() => const ActionsScren());

                  break;
                case 2:
                  // Handle 'Attachments' tab
                  break;
                case 3:
                  // Handle 'Actions' tab
                  break;
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.task,),
                label: 'Tasks',

              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pending_actions),
                label: 'actions',

              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.attachment),
                label: 'attachments',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
