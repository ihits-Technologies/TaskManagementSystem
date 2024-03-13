

import 'package:tms/core/strings/strings.dart';

class ReceivedOverdue {
  final String task_name;
  final String? assign_name;
  final String status;
  final String assigndate;

  ReceivedOverdue(
      this.task_name,
      this.assign_name,
      this.status,
      this.assigndate);
}

List receivetaskoverdue = [
  ReceivedOverdue("Feasibility Study", "Issac John", AppStrings.overdue, AppStrings.date),
  ReceivedOverdue("Prototyping", "Abin Berly", AppStrings.overdue, AppStrings.date),
  ReceivedOverdue("3D rendering", "Amal Pradeep", AppStrings.overdue, AppStrings.date),
  ReceivedOverdue("Product Assembly", "Riyas", AppStrings.overdue, AppStrings.date),
  ReceivedOverdue("Product Documentation", "Anandhu Ajay",AppStrings.overdue ,
      AppStrings.date),
  ReceivedOverdue("Market Research", "Indrajith Salim", AppStrings.overdue, AppStrings.date),
  ReceivedOverdue("Proposed to HOCL", "Ben Sharooq", AppStrings.overdue, AppStrings.date)
];
