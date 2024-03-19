

import 'package:tms/core/strings/strings.dart';

class AssignedPending {
  final String task_name;
  final String? assign_name;
  final String status;
  final String assigndate;

  AssignedPending(
      this.task_name,
      this.assign_name,
      this.status,
      this.assigndate);
}

List assigntaskpending = [
  AssignedPending("Market Research", "Riyas", AppStrings.pending, AppStrings.date),
  AssignedPending("Prototyping", "Abin Berly", AppStrings.pending, AppStrings.date),
  AssignedPending("3D rendering", "Amal Pradeep", AppStrings.pending, AppStrings.date),
  AssignedPending("Product Assembly", "Issac John", AppStrings.pending, AppStrings.date),
  AssignedPending("Product Documentation", "Anandhu Ajay",AppStrings.pending ,
      AppStrings.date),
  AssignedPending("Proposed to HOCL", "Indrajith Salim", AppStrings.pending, AppStrings.date),
  AssignedPending("Feasibility Study", "Ben Sharooq", AppStrings.pending, AppStrings.date)
];
