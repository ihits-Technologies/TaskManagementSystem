
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/core/colors/colors.dart';
import 'package:tms/screens/task_received/pending/models/task_receive_pending_model.dart';



class ReceivedPendingListItemController extends GetxController {

}

class ReceivedPendingListItem extends GetView {
  final ReceivedPendingListItemController controller = Get.put(ReceivedPendingListItemController());

  final Color containerColor;
  final String itemText;
  final int index;

  ReceivedPendingListItem( {
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
                title: Text(receivetaskpending[index].task_name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                subtitle: Row(
                  children: [
                    Text(receivetaskpending[index].assign_name),
                    const SizedBox(width: 10,),
                    const Text("|"),
                    const SizedBox(width: 10,),
                    Text(receivetaskpending[index].assigndate)
                  ],
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                trailing: Text(receivetaskpending[index].status,style: TextStyle(color: yellowColor),),
              ),
            ),
          ),
        );
      },
    );
  }
}
