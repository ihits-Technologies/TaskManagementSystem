



import '../../../../constants/strings/strings.dart';

class User {
  final String name;
  final String image;
  final String docname;
  final String receivedate;

  User(
      this.name,
      this.image,
      this.docname,
      this.receivedate);
}

List users = [
  User("Abin", "assets/Ellipse 11.png", "resume.pdf", AppStrings.date),
  User("Ben Sharooq", "assets/Ellipse 182.png", "Video", AppStrings.date),
  User("Catherine", "assets/Ellipse 186.png", "biodata.pdf", AppStrings.date),
  User("Daine", "assets/Ellipse 188.png", "landscape",AppStrings.date),
  User("Indrajith Salim", "assets/Ellipse 190.png", "resume.pdf",AppStrings.date),
  User("Rafshi", "assets/Ellipse 194.png", "resume.pdf",AppStrings.date),
  User("Riyas", "assets/Ellipse 186.png", "biodata.pdf",AppStrings.date )
];
