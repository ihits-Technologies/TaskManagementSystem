import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/bottom_navigation.dart';
import '../../../constants/colors/colors.dart';
import 'models/attachment_outbox_list.dart';
import 'models/user_outbox.dart';

class OutboxController extends GetxController {
  RxInt currentIndex = 0.obs;
}
class OutboxPage extends StatelessWidget {
  final OutboxController controller = Get.put(OutboxController());
   OutboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appBarColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 1),
                  width: Get.width,
                  height: Get.height,
                  decoration: const BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    itemCount: outboxusers.length,
                    itemBuilder: (context, index) {
                      String itemText = '';

                      return AttachmentOutboxList(
                        itemText: itemText,
                        index: index,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBarWidget(controller: controller),
      ),
    );
  }
}
