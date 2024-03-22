



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
  User("Abin", "lib/Assets/Ellipse 11.png", "resume.pdf", AppStrings.date),
  User("Ben Sharooq", "lib/Assets/Ellipse 182.png", "Video", AppStrings.date),
  User("Catherine", "lib/Assets/Ellipse 186.png", "biodata.pdf", AppStrings.date),
  User("Daine", "lib/Assets/Ellipse 188.png", "landscape",AppStrings.date),
  User("Indrajith Salim", "lib/Assets/Ellipse 190.png", "resume.pdf",AppStrings.date),
  User("Rafshi", "lib/Assets/Ellipse 194.png", "resume.pdf",AppStrings.date),
  User("Riyas", "lib/Assets/Ellipse 188.png", "biodata.pdf",AppStrings.date )
];
