

import '../../../../core/strings/strings.dart';

class AssignedOverdue {
  final String task_name;
  final String? assign_name;
  final String status;
  final String assigndate;

  AssignedOverdue(
      this.task_name,
      this.assign_name,
      this.status,
      this.assigndate);
}

List assigntaskoverdue = [
  AssignedOverdue("Product Research", "Ben Sharooq", AppStrings.overdue, AppStrings.date),
  AssignedOverdue("Prototyping", "Abin Berly", AppStrings.overdue, AppStrings.date),
  AssignedOverdue("3D rendering", "Amal Pradeep", AppStrings.overdue, AppStrings.date),
  AssignedOverdue("Market Research", "Issac John", AppStrings.overdue, AppStrings.date),
  AssignedOverdue("Product Documentation", "Anandhu Ajay",AppStrings.overdue ,
      AppStrings.date),
  AssignedOverdue("Proposed to HOCL", "Indrajith Salim", AppStrings.overdue, AppStrings.date),
  AssignedOverdue("Feasibility Study", "Riyas", AppStrings.overdue, AppStrings.date)
];
