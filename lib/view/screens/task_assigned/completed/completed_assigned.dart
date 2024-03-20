
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/colors/colors.dart';
import 'models/task_assign_model.dart';
import 'widgets/assigned_list_item.dart';

class CompletedAssigned extends StatelessWidget {
  const CompletedAssigned({super.key});

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
              itemCount: assignedTaskCompleted.length,
              itemBuilder: (context, index) {
                String itemText = '';

                return AssignedListItem(
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

