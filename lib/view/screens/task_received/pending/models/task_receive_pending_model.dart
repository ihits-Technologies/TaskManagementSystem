


import '../../../../../constants/strings/strings.dart';

class ReceivedPending {
  final String taskName;
  final String? assignName;
  final String status;
  final String assignDate;

  ReceivedPending(
      this.taskName,
      this.assignName,
      this.status,
      this.assignDate,
      );
}

List<ReceivedPending> receivetaskpending = [
  ReceivedPending("Feasibility Study", "Issac John", AppStrings.pending, AppStrings.date),
  ReceivedPending("Prototyping", "Abin Berly", AppStrings.pending, AppStrings.date),
  ReceivedPending("3D rendering", "Amal Pradeep", AppStrings.pending, AppStrings.date),
  ReceivedPending("Product Assembly", "Riyas", AppStrings.pending, AppStrings.date),
  ReceivedPending("Product Documentation", "Anandhu Ajay", AppStrings.pending, AppStrings.date),
  ReceivedPending("Market Research", "Indrajith Salim", AppStrings.pending, AppStrings.date),
  ReceivedPending("Proposed to HOCL", "Ben Sharooq", AppStrings.pending, AppStrings.date),
];
