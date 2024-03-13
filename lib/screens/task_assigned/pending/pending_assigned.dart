
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/colors/colors.dart';
import 'models/pending_task_assign_model.dart';
import 'widgets/assigned_pending_list_item.dart';

class PendingAssigned extends StatelessWidget {
  const PendingAssigned({super.key});

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
                    itemCount: assigntaskpending.length,
                    itemBuilder: (context, index) {
                      String itemText = '';

                      return AssignedPendingListItem(
                        index: index,
                        containerColor: greenColor,
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
