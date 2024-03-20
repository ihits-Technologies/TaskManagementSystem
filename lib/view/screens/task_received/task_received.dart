import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_bar.dart';
import '../../../constants/colors/colors.dart';
import '../../../constants/strings/strings.dart';
import 'completed/completed_received.dart';
import 'overdue/overdue_received.dart';
import 'pending/pending_received.dart';

class ReceivedController extends GetxController {
  RxInt currentIndex = 0.obs;
}

class Received extends StatefulWidget {
  const Received({super.key});

  @override
  State<Received> createState() => _ReceivedState();
}

class _ReceivedState extends State<Received> with SingleTickerProviderStateMixin {
  final ReceivedController controller = Get.put(ReceivedController());

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(
          title: AppStrings.received,

        ),
        backgroundColor: appBarColor,
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: AppStrings.pending),
                Tab(text: AppStrings.overdue),
                Tab(text: AppStrings.completed),
              ],
              labelStyle: TextStyle(fontSize: 14, color: backgroundColor),
              unselectedLabelStyle: TextStyle(fontSize: 12, color: Colors.white60),
              indicatorColor: greyColor,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  PendingReceived(),
                  OverdueReceived(),
                  CompletedReceived(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
