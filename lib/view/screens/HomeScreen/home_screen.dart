import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../app_colors/app_colors.dart';
import '../NavigationScreens/ActionsScreen/actions_screen.dart';
import '../NavigationScreens/attachment_screen.dart';
import '../NavigationScreens/chat_screen.dart'
    '';
import '../NavigationScreens/task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RxInt _selectedIndex = 0.obs;

  final List<Widget> pages = [
    TaskScreen(),
    const ActionsScreen(),
    const ChatScreen(),
    const AttachmentScreen(),
  ];

  final Map<int, String> _appBarTitles = {
    0: 'Tasks',
    1: 'Actions',
    2: 'Chat',
    3: 'Attachments',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: AppColors.appbarGradiaent),
          ),
          leading: _selectedIndex.value == 0
              ? IconButton(
                  icon: const Icon(
                    Icons.menu_sharp,
                    size: 40,
                    color: AppColors.announcementColor,
                  ),
                  onPressed: () {},
                )
              : IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    // Navigate back to the Task screen
                    _selectedIndex.value = 0;
                  },
                ),

          title: Obx(() => Text(_appBarTitles[_selectedIndex.value] ?? '')),
          actions: [
            IconButton(
              icon: const Icon(Icons.account_circle),
              color: Colors.black,
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: pages[_selectedIndex.value],
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            selectedItemColor: AppColors.selectedColor,
            unselectedItemColor: Colors.grey,
            currentIndex: _selectedIndex.value,
            iconSize: 25,
            onTap: (index) {
              _selectedIndex.value = index;
              // Adapt back navigation based on your routing approach (e.g., Get.back() or Navigator.pop())
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.task,
                ),
                label: 'Tasks',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.pending_actions,
                ),
                label: 'Actions',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.attachment),
                label: 'Attachments',
              ),
            ],
          )),
    );
  }
}
