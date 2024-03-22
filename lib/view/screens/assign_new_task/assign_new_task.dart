import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constants/colors/colors.dart';
import '../../../constants/strings/strings.dart';
import 'models/assign_new_model.dart';


class AssignTaskStep extends StatelessWidget {
  final RxString _value = "-1".obs;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: appBarColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(
          AppStrings.tasks,
          style: TextStyle(
            color: blackColor,
            fontSize: screenWidth * 0.06,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          SizedBox(
            width: screenWidth * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.04),
            child: CircleAvatar(
              backgroundImage: AssetImage('lib/Assets/profilepic.png'),
              radius: screenWidth * 0.04,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppStrings.title,
                    style: TextStyle(color: backgroundColor, fontSize: 20),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    assignNew[0].title,
                    style: const TextStyle(
                        color: backgroundColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  const Text(
                    AppStrings.assignto,
                    style: TextStyle(color: backgroundColor, fontSize: 20),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    assignNew[0].assignTo,
                    style: const TextStyle(
                        color: backgroundColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(screenWidth * 0.12),
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
                  const Text(
                    AppStrings.description,
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Container(
                    width: screenWidth * 0.8,
                    child: Text(
                      assignNew[0].description,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  const Text(
                    AppStrings.duedate,
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  InkWell(
                    onTap: () => onTapFunction(context: context),
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: datePickerController,
                        readOnly: true,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.calendar_today),
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  const Text(
                    AppStrings.priority,
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  DropdownButtonFormField(
                    padding: EdgeInsets.all(screenWidth * 0.02),
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
                        value: "-1",
                        child: Text(
                          "--",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "1",
                        child: Text("High"),
                      ),
                      DropdownMenuItem(
                        value: "2",
                        child: Text("Medium"),
                      ),
                      DropdownMenuItem(
                        value: "3",
                        child: Text("Low"),
                      ),
                    ],
                    onChanged: (v) {
                      _value.value = v.toString();
                    },
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Container(
                    width: screenWidth * 0.8,
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appBarColor,
                        elevation: 5,
                      ),
                      child: const Text(
                        AppStrings.submit,
                        style: TextStyle(
                          color: backgroundColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
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

TextEditingController datePickerController = TextEditingController();

onTapFunction({required BuildContext context}) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    lastDate: DateTime.now(),
    firstDate: DateTime(2015),
    initialDate: DateTime.now(),
  );
  if (pickedDate == null) return;
  datePickerController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
}
