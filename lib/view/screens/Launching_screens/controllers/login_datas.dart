//
//
// void addSampleData() {
//   DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
//   databaseReference.child('users').set({
//     'user1': {
//       'companyID': 'company1',
//       'userID': 'user1',
//       'password': 'password1',
//       'phoneNumber': '1234567890',
//     },
//     'user2': {
//       'companyID': 'company2',
//       'userID': 'user2',
//       'password': 'password2',
//       'phoneNumber': '9876543210',
//     },
//     // Add more sample data as needed
//   });
// }
// void getUsers() {
//   DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
//   databaseReference.child('users').once().then((DataSnapshot snapshot) {
//     Map<dynamic, dynamic> values = snapshot.value;
//     values.forEach((key, value) {
//       print('User ID: $key');
//       print('Company ID: ${value['companyID']}');
//       print('User ID: ${value['userID']}');
//       print('Password: ${value['password']}');
//       print('Phone Number: ${value['phoneNumber']}');
//     });
//   });
// }
//
