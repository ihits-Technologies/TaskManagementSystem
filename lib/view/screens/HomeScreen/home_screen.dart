import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:tms/view/screens/NavigationScreens/ChatScreen/chat_home.dart';


import '../../../constants/app_colors/app_colors.dart';
import '../NavigationScreens/ActionsScreen/actions_screen.dart';
import '../NavigationScreens/task_screen.dart';
import '../attachment_page/attachment.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  final RxInt _selectedIndex = 0.obs;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: _selectedIndex.value != 1
          ? PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: AppBar(
                flexibleSpace: Container(
                  decoration:
                      BoxDecoration(gradient: AppColors.appbarGradiaent),
                ),
                leading: _selectedIndex.value > 0
                    ? IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          _pageController.jumpToPage(0);
                        },
                      )
                    : IconButton(
                        icon: const Icon(
                          Icons.menu_sharp,
                          size: 40,
                          color: AppColors.announcementColor,
                        ),
                        onPressed: () {},
                      ),
                title: Obx(() {
                  switch (_selectedIndex.value) {
                    case 0:
                      return const Text('Tasks'); // No app bar for Tasks
                    case 1:
                      return const Text('Actions');
                    case 2:
                      return const Text('Chat');
                    case 3:
                      return const Text('Attachments');
                    default:
                      return const Text('');
                  }
                }),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.account_circle),
                    color: Colors.black,
                    onPressed: () {},
                  ),
                ],
              ),
            )
          : null,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          _selectedIndex.value = index;
        },

        children: [
          TaskScreen(), // No app bar
          ActionScreen(tasks: dummyTasks),
          ChatScreen(),
          AttachPage(),
        ],
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            selectedItemColor: AppColors.selectedColor,
            unselectedItemColor: Colors.grey,
            currentIndex: _selectedIndex.value,
            iconSize: 25,
            onTap: (index) {
              _pageController.jumpToPage(index);
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
