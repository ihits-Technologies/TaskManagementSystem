
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/view/screens/assign_new_task/assign_new_task.dart';
import '../../../constants/colors/colors.dart';
import '../../../constants/strings/strings.dart';
import 'completed/completed_assigned.dart';
import 'overdue/overdue_assigned.dart';
import 'pending/pending_assigned.dart';

class AssignedController extends GetxController {
  RxInt currentIndex = 0.obs;
}

class Assigned extends StatefulWidget {
  @override
  State<Assigned> createState() => _AssignedState();
}

class _AssignedState extends State<Assigned>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AssignedController controller = Get.put(AssignedController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appBarColor,
            title: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: Get.width * 0.01, top: Get.width * 0.02),
                  child: Text(
                    AppStrings.assigned,
                    style: TextStyle(
                      color: blackColor,
                      fontSize: Get.width * 0.05,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(AssignTaskStep());
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 15),
              Padding(
                padding: EdgeInsets.only(right: Get.width * 0.04),
                child: CircleAvatar(
                  backgroundImage: AssetImage('lib/Assets/profilepic.png'),
                  radius: Get.width * 0.04,
                ),
              ),
            ],
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: TabBar(
                tabs: [
                  Tab(
                    text: AppStrings.completed,
                  ),
                  Tab(
                    text: AppStrings.pending,
                  ),
                  Tab(
                    text: AppStrings.overdue,
                  )
                ],
                labelStyle: TextStyle(fontSize: 14, color: backgroundColor),
                unselectedLabelStyle:
                    TextStyle(fontSize: 12, color: Colors.white60),
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                ),
              ),
            ),
          ),
          backgroundColor: appBarColor,
          body: const TabBarView(children: [
            CompletedAssigned(),
            PendingAssigned(),
            OverdueAssigned()
          ]),
        ));
  }
}
