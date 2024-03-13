

import '../../../../core/strings/strings.dart';

class ReceivedCompleted {
  final String task_name;
  final String? assign_name;
  final String status;
  final String assigndate;

  ReceivedCompleted(
      this.task_name,
      this.assign_name,
      this.status,
      this.assigndate);
}

List receivetaskcomplete = [
  ReceivedCompleted("Proposed to HOCL", "Issac John", "Completed", AppStrings.date),
  ReceivedCompleted("Prototyping", "Abin Berly", "Completed", AppStrings.date),
  ReceivedCompleted("3D rendering", "Amal Pradeep", "Completed", AppStrings.date),
  ReceivedCompleted("Product Assembly", "Riyas", "Completed", AppStrings.date),
  ReceivedCompleted("Product Documentation", "Anandhu Ajay","Completed" ,
      AppStrings.date),
  ReceivedCompleted("Market Research", "Indrajith Salim", "Completed", AppStrings.date),
  ReceivedCompleted("Feasibility Study", "Ben Sharooq", "Completed", AppStrings.date)
];
