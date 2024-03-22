//
// class ChatService {
//   final CollectionReference _chatsCollection =
//       FirebaseFirestore.instance.collection('chats');
//
//   Future<void> sendMessage(
//       String chatId, String message, String senderId) async {
//     await _chatsCollection.doc(chatId).collection('messages').add({
//       'text': message,
//       'senderId': senderId,
//       'timestamp':
//           FieldValue.serverTimestamp(), // Automatically sets server timestamp
//     });
//   }
//
//   Stream<QuerySnapshot> getMessagesStream(String chatId) {
//     return _chatsCollection
//         .doc(chatId)
//         .collection('messages')
//         .orderBy('timestamp') // Order messages by timestamp
//         .snapshots();
//   }
// }
