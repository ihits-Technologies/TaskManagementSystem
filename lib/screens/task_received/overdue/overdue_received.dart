
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/core/colors/colors.dart';
import 'package:tms/screens/task_assigned/completed/models/task_assign_model.dart';

import 'widgets/received_overdue_list_item.dart';

class OverdueReceived extends StatelessWidget {
  const OverdueReceived({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              child: LayoutBuilder(
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: assigntasks.length,
                    itemBuilder: (context, index) {
                      String itemText = '';

                      return ReceivedOverdueListItem(
                        index: index,
                        containerColor: redColor,
                        itemText: itemText,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );

  }
}

