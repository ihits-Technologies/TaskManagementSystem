
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/colors/colors.dart';
import 'models/overdue_task_assign_model.dart';
import 'widgets/assigned_overdue_list_item.dart';

class OverdueAssigned extends StatelessWidget {
  const OverdueAssigned({super.key});

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
          itemCount: assigntaskoverdue.length,
          itemBuilder: (context, index) {
            String itemText = '';

            return AssignedOverdueListItem(
              index: index,
              containerColor: greenColor,
              itemText: itemText,
            );
          },
        ),
      ),
    );
  }
}
