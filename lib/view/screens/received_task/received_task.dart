import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors/colors.dart';
import '../../../constants/strings/strings.dart';


class ReceivedTaskStep extends StatelessWidget {
  final RxString _value = "-1".obs;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: appBarColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Row(
          children: [

            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.02),
              child: Text(
                AppStrings.tasks,
                style: TextStyle(
                  color: blackColor,
                  fontSize: screenWidth * 0.06,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ],
        ),
        actions: [
          const SizedBox(width: 15),
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.04),
            child: CircleAvatar(
              backgroundImage: AssetImage('lib/Assets/profilepic.png'),
              radius: screenWidth * 0.05,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.title,
                    style: TextStyle(color: backgroundColor, fontSize: 20),
                  ),
                  SizedBox(height: 13),
                  Text(
                    AppStrings.designChanges,
                    style: TextStyle(
                        color: backgroundColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 50),
                  Text(
                    AppStrings.assignedBy,
                    style: TextStyle(color: backgroundColor, fontSize: 20),
                  ),
                  SizedBox(height: 13),
                  Text(
                    AppStrings.task_name,
                    style: TextStyle(
                        color: backgroundColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              width: screenWidth,
              decoration: const BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.description,
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: screenWidth * 0.8,
                    child: Text(
                      AppStrings.description_detail,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    AppStrings.duedate,
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    AppStrings.date,
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    AppStrings.status,
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  DropdownButtonFormField(
                    padding: EdgeInsets.all(10),
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ),
                    value: _value.value,
                    items: const [
                      DropdownMenuItem(
                        child: Text(
                          "",
                          style: TextStyle(color: Colors.grey),
                        ),
                        value: "-1",
                      ),
                      DropdownMenuItem(
                        child: Text("Completed"),
                        value: "1",
                      ),
                      DropdownMenuItem(
                        child: Text("Hold"),
                        value: "2",
                      ),
                    ],
                    onChanged: (v) {
                      _value.value = v.toString();
                    },
                  ),
                  SizedBox(height: 40),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    width: screenWidth * 0.8,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle button press
                      },
                      child: Text(
                        AppStrings.submit,
                        style: TextStyle(
                          color: backgroundColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appBarColor,
                        elevation: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
