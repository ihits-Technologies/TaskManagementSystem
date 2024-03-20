
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors/colors.dart';
import 'models/task_receive_complete_model.dart';
import 'widgets/received_completed_list_item.dart';

class CompletedReceived extends StatelessWidget {
  const CompletedReceived({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26),
            topRight: Radius.circular(26),
          ),
        ),
        child: ListView.builder(
          itemCount: receivetaskcomplete.length,
          itemBuilder: (context, index) {
            String itemText = '';

            return ReceivedCompleteListItem(
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

