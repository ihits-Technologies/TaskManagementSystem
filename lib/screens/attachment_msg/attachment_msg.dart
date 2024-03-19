
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/app_bar.dart';
import 'package:tms/core/colors/colors.dart';

import 'models/attach_msg_model.dart';


class AttachmentMessage extends StatelessWidget {
  const AttachmentMessage({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: appBarColor,
      appBar: CustomAppBar(title: attachimg[0].aUsername,),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 1),
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
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var attach in attachimg)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: Image.asset(
                            attach.image,
                            width: screenWidth * 0.7,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 120,
                          child: Expanded(
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                attach.receivedtime,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, right: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Container(
                      child: PhysicalModel(
                        color: Colors.white,
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(35.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 1,
                            )
                          ]),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.attach_file_outlined),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    right: 15,
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Add Attachment",
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: appBarColor,
                                  borderRadius: BorderRadius.circular(80.0)
                                ),

                                  child: IconButton(onPressed: (){}, icon: Icon(Icons.send)))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
