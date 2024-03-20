



import '../../../../../constants/strings/strings.dart';

class AssignedCompleted {
  final String task_name;
  final String? assign_name;
  final String status;
  final String assigndate;

  AssignedCompleted(
      this.task_name,
      this.assign_name,
      this.status,
      this.assigndate);
}

List assignedTaskCompleted = [
  AssignedCompleted("Proposed to HOCL", "Issac John", "Completed", AppStrings.date),
  AssignedCompleted("Prototyping", "Abin Berly", "Completed", AppStrings.date),
  AssignedCompleted("3D rendering", "Amal Pradeep", "Completed", AppStrings.date),
  AssignedCompleted("Product Assembly", "Riyas", "Completed", AppStrings.date),
  AssignedCompleted("Product Documentation", "Anandhu Ajay","Completed" ,
      AppStrings.date),
  AssignedCompleted("Market Research", "Indrajith Salim", "Completed", AppStrings.date),
  AssignedCompleted("Feasibility Study", "Ben Sharooq", "Completed", AppStrings.date)
];
