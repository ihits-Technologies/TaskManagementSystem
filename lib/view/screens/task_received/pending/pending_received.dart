
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors/colors.dart';
import 'models/task_receive_pending_model.dart';
import 'widgets/received_pending_list_item.dart';

class PendingReceived extends StatelessWidget {
  const PendingReceived({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        child: ListView.builder(
          itemCount: receivetaskpending.length,
          itemBuilder: (context, index) {
            String itemText = '';

            return ReceivedPendingListItem(
                containerColor: yellowColor,
                index: index);
          },
        ),
      ),
    );

  }
}

