



import '../../../../constants/strings/strings.dart';

class OutboxUser {
  final String oname;
  final String oimage;
  final String odocname;
  final String oreceivedate;

  OutboxUser(
    this.oname, this.oimage, this.odocname, this.oreceivedate);
}

List outboxusers = [
  OutboxUser("Riyas", "lib/Assets/Ellipse 194.png", "resume.pdf", AppStrings.date),
  OutboxUser("Berly", "lib/Assets/Ellipse 190.png", "Video", AppStrings.date),
  OutboxUser("Catherine", "lib/Assets/Ellipse 188.png", "biodata.pdf", AppStrings.date),
  OutboxUser("Daine", "lib/Assets/Ellipse 186.png", "landscape",AppStrings.date),
  OutboxUser("Amal", "lib/Assets/Ellipse 182.png", "resume.pdf",AppStrings.date),
  OutboxUser("Rafshi", "lib/Assets/Ellipse 11.png", "resume.pdf",AppStrings.date),
  OutboxUser("Ben Sharooq", "lib/Assets/Ellipse 190.png", "biodata.pdf",AppStrings.date )
];
