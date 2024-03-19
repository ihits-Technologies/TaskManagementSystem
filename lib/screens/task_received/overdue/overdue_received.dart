
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/colors/colors.dart';
import 'models/task_receive_overdue_model.dart';
import 'widgets/received_overdue_list_item.dart';
class OverdueReceived extends StatelessWidget {
  const OverdueReceived({super.key});

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
          itemCount: receivetaskoverdue .length,
          itemBuilder: (context, index) {
            String itemText = '';

            return ReceivedOverdueListItem(
              index: index,
              containerColor: redColor,
              itemText: itemText,
            );
          },
        ),
      ),
    );

  }
}

