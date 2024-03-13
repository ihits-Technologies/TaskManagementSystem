

import '../../../core/strings/strings.dart';

class OutboxUser {
  final String oname;
  final String oimage;
  final String odocname;
  final String oreceivedate;

  OutboxUser(
    this.oname, this.oimage, this.odocname, this.oreceivedate);
}

List outboxusers = [
  OutboxUser("Riyas", "assets/Ellipse 186.png", "resume.pdf", AppStrings.date),
  OutboxUser("Berly", "assets/Ellipse 194.png", "Video", AppStrings.date),
  OutboxUser("Catherine", "assets/Ellipse 11.png", "biodata.pdf", AppStrings.date),
  OutboxUser("Daine", "assets/Ellipse 188.png", "landscape",AppStrings.date),
  OutboxUser("Amal", "assets/Ellipse 190.png", "resume.pdf",AppStrings.date),
  OutboxUser("Rafshi", "assets/Ellipse 194.png", "resume.pdf",AppStrings.date),
  OutboxUser("Ben Sharooq", "assets/Ellipse 182.png", "biodata.pdf",AppStrings.date )
];
