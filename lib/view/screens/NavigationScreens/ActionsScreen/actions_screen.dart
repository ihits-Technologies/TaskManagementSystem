import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import intl package for date formatting
import 'package:tms/constants/app_colors/app_colors.dart';
import '../../../../models/Action/ActionItem.dart';
import 'actionDetails.dart';

class ActionScreen extends StatelessWidget {
  final List<ActionItem> tasks;

  const ActionScreen({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          // Format the date string into DateTime object
          final formattedDate = DateFormat('dd MMM yyyy').format(DateTime.parse(task.date));
          return Container(
            margin: const EdgeInsets.all(1.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              title: Text(
                task.title,
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${task.assignedPerson}  |  $formattedDate', // Use formatted date here
                      style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              trailing: task.isPending
                  ? const Text(
                'Pending',
                style: TextStyle(color: AppColors.pendingColor, fontSize: 15),
              )
                  : const Text(
                'Completed',
                style: TextStyle(color: AppColors.completedColor, fontSize: 15),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ActionDetailScreen(action: task),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// Dummy data

List<ActionItem> dummyTasks = [
  ActionItem(
    title: 'Proposed to HOCL',
    assignedPerson: 'John Doe',
    date: '2024-02-20', // Updated date format
    isPending: true,
    actionsTaken: [],
  ),
  ActionItem(
    title: 'Reviewed financial reports',
    assignedPerson: 'Alice Smith',
    date: '2024-02-21', // Updated date format
    isPending: false,
    actionsTaken: [],
  ),
  ActionItem(
    title: 'Meeting with stakeholders',
    assignedPerson: 'Emily Johnson',
    date: '2024-02-22', // Updated date format
    isPending: true,
    actionsTaken: [],
  ),
  ActionItem(
    title: 'Presentation preparation',
    assignedPerson: 'Michael Brown',
    date: '2024-02-23', // Updated date format
    isPending: false,
    actionsTaken: [],
  ),
  ActionItem(
    title: 'Project planning',
    assignedPerson: 'Sophia Wilson',
    date: '2024-02-24', // Updated date format
    isPending: true,
    actionsTaken: [],
  ),
];



