import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors/colors.dart';
import '../../../constants/strings/strings.dart';
import 'inbox.dart';
import 'outbox.dart';

class AttachController extends GetxController {
  final tabIndex = 0.obs;

  void changeTabIndex(int index) => tabIndex.value = index;
}

class AttachPage extends StatefulWidget {
  const AttachPage({Key? key}) : super(key: key);

  @override
  State<AttachPage> createState() => _AttachPageState();
}

class _AttachPageState extends State<AttachPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AttachController controller = Get.put(AttachController());
  bool ShowAppBar = true;

  @override
  void initState() {
    super.initState();
    final controller = Get.put(AttachController());
    _tabController = TabController(
      length: 2,
      initialIndex: controller.tabIndex.value,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AttachController());

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: appBarColor,
              child: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: TabBar(
                  tabs: const [
                    Tab(
                      text: "Inbox",
                    ),
                    Tab(
                      text: "Outbox",
                    ),
                  ],
                  labelStyle: const TextStyle(fontSize: 14, color: backgroundColor),
                  unselectedLabelStyle:
                  const TextStyle(fontSize: 12, color: Colors.white60),
                  indicator: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                  ),
                  controller: _tabController,
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [InboxPage(), OutboxPage()],
              ),
            ),
          ],
        ),
      ),
    );

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
