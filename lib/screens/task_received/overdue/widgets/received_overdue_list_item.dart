
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/core/colors/colors.dart';

import '../models/task_receive_overdue_model.dart';



class ReceivedOverdueListItemController extends GetxController {

}

class ReceivedOverdueListItem extends GetView {
  final ReceivedOverdueListItemController controller = Get.put(ReceivedOverdueListItemController());

  final Color containerColor;
  final String itemText;
  final int index;

  ReceivedOverdueListItem( {
    Key? key,
    required this.containerColor,
    this.itemText = "",
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final containerHeight = screenWidth * 0.12;
        return Padding(
          padding: EdgeInsets.only(
            top: screenWidth * 0.01,
            left: screenWidth * 0.01,
            right: screenWidth * 0.01,
          ),
          child: GestureDetector(
            onTap: () async {
              // Get.to(() => AssignTaskStep());
            },
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              elevation: 1,
              child: ListTile(
                tileColor: Colors.white,
                title: Text(receivetaskoverdue[index].task_name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                subtitle: Row(
                  children: [
                    Text(receivetaskoverdue[index].assign_name),
                    SizedBox(width: 10,),
                    Text("|"),
                    SizedBox(width: 10,),
                    Text(receivetaskoverdue[index].assigndate)
                  ],
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                trailing: Text(receivetaskoverdue[index].status,style: TextStyle(color: redColor),),
              ),
            ),
          ),
        );
      },
    );
  }
}
