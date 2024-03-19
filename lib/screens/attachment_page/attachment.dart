
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/screens/attachment_page/inbox.dart';
import '../../core/colors/colors.dart';
import '../../core/strings/strings.dart';
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

class _AttachPageState extends State<AttachPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AttachController controller = Get.put(AttachController());

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
        appBar: AppBar(
          backgroundColor: appBarColor,
          title: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.01, top: Get.width * 0.02),
                child: Text(
                  AppStrings.attachment,
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
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 15),
            Padding(
              padding: EdgeInsets.only(right: Get.width * 0.04),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/profilepic.png'),
                radius: Get.width * 0.04,
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: TabBar(
              tabs: const [
                Tab(
                  text: "Inbox",
                ),
                Tab(
                  text: "Outbox",
                ),
              ],
              labelStyle: TextStyle(fontSize: 14, color: backgroundColor),
              unselectedLabelStyle: TextStyle(fontSize: 12, color: Colors.white60),
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 2.0),
                ),
              ),
              controller: _tabController,
            ),
          ),
        ),
        body: TabBarView(
            children: [InboxPage(), OutboxPage()],
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
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