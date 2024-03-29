
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user_outbox.dart';

class AttachmentListController extends GetxController {}

class AttachmentOutboxList extends GetView {
  @override


  final String itemText;

  final int index;

  AttachmentOutboxList({
    Key? key,
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
              // Get.to(() => ReceivedTaskStep());
            },
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              elevation: 2,
              child: ListTile(
                tileColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.grey,
                            width: 4.0
                        )
                    ),
                    child: CircleAvatar(
                      radius: screenWidth * 0.06,
                      backgroundImage: AssetImage(outboxusers[index].oimage),
                    ),
                  ),
                ),
                title: Text(
                  outboxusers[index].oname,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(outboxusers[index].odocname),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(outboxusers[index].oreceivedate),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
              ),
            ),
          ),
        );
      },
    );
  }
}
