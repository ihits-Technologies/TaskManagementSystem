


import '../../../../../constants/strings/strings.dart';

class ReceivedCompleted {
  final String taskName;
  final String assignName;
  final String status;
  final String assignDate;

  ReceivedCompleted(
      this.taskName,
      this.assignName,
      this.status,
      this.assignDate,
      );
}

List<ReceivedCompleted> receivetaskcomplete = [
  ReceivedCompleted("Proposed to HOCL", "Issac John", "Completed", AppStrings.date),
  ReceivedCompleted("Prototyping", "Abin Berly", "Completed", AppStrings.date),
  ReceivedCompleted("3D rendering", "Amal Pradeep", "Completed", AppStrings.date),
  ReceivedCompleted("Product Assembly", "Riyas", "Completed", AppStrings.date),
  ReceivedCompleted("Product Documentation", "Anandhu Ajay", "Completed", AppStrings.date),
  ReceivedCompleted("Market Research", "Indrajith Salim", "Completed", AppStrings.date),
  ReceivedCompleted("Feasibility Study", "Ben Sharooq", "Completed", AppStrings.date),
];
