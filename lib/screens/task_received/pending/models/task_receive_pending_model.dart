

import 'package:tms/core/strings/strings.dart';

class ReceivedPending {
  final String task_name;
  final String? assign_name;
  final String status;
  final String assigndate;

  ReceivedPending(
      this.task_name,
      this.assign_name,
      this.status,
      this.assigndate);
}

List receivetaskpending = [
  ReceivedPending("Feasibility Study", "Issac John", AppStrings.pending, AppStrings.date),
  ReceivedPending("Prototyping", "Abin Berly", AppStrings.pending, AppStrings.date),
  ReceivedPending("3D rendering", "Amal Pradeep", AppStrings.pending, AppStrings.date),
  ReceivedPending("Product Assembly", "Riyas", AppStrings.pending, AppStrings.date),
  ReceivedPending("Product Documentation", "Anandhu Ajay",AppStrings.pending ,
      AppStrings.date),
  ReceivedPending("Market Research", "Indrajith Salim", AppStrings.pending, AppStrings.date),
  ReceivedPending("Proposed to HOCL", "Ben Sharooq", AppStrings.pending, AppStrings.date)
];
