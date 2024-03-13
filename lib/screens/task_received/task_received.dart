
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/colors/colors.dart';
import '../../core/strings/strings.dart';
import 'completed/completed_received.dart';
import 'overdue/overdue_received.dart';
import 'pending/pending_received.dart';

class ReceivedController extends GetxController {
  RxInt currentIndex = 0.obs;
}

class Received extends StatefulWidget {
  @override
  State<Received> createState() => _ReceivedState();
}

class _ReceivedState extends State<Received>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ReceivedController controller = Get.put(ReceivedController());

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
                    AppStrings.received,
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
              // IconButton(
              //   onPressed: () {},
              //   icon: const Icon(
              //     Icons.add,
              //     color: Colors.white,
              //   ),
              // ),
              const SizedBox(width: 15),
              Padding(
                padding: EdgeInsets.only(right: Get.width * 0.04),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/profilepic.png'),
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
          body: TabBarView(children: [
            CompletedReceived(),
            PendingReceived(),
            OverdueReceived()
          ]),
        ));
  }
}
