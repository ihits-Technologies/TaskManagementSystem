import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:tms/constants/app_drawer.dart';
import 'package:tms/view/screens/attachment_page/attachment.dart';
import '../../../constants/app_colors/app_colors.dart';
import '../NavigationScreens/ActionsScreen/actions_screen.dart';
import '../NavigationScreens/chat_screen.dart';
import '../NavigationScreens/task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  final RxInt _selectedIndex = 0.obs;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white70,
      appBar: _selectedIndex.value != 1
          ? PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: AppColors.appbarGradiaent),
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
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          title: Obx(() {
            switch (_selectedIndex.value) {
              case 0:
                return const Text('Tasks');
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
          ActionsScreen(),
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
      drawer:MyDrawer(),
    );
  }
}
