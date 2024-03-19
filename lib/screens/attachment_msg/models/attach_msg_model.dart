

class User {
  final String aUsername;
  final String image;
  final String docname;
  final String receivedtime;

  User(
      this.image,
      this.docname,
      this.receivedtime,
      this.aUsername);
}

List attachimg = [
  User( "assets/images/attach1.png", "resume.pdf","2:30 pm","Riyas"),
  User( "assets/images/attach2.jpeg", "Video", "3:25 pm","Ben Sharooq"),
  User( "assets/images/attach3.jpeg", "biodata.pdf","4:14 pm","Indrajith"),

];
