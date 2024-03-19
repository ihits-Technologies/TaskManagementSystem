import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
Future<DocumentReference> creatChat(
    String chatId, Map<String, bool> participants) async {
  final chatRef = await firestore.collection('chats').add({
    'participants': participants,
  });
  return chatRef;
}

Future<void> addMessage(
    String chatId, String messageId, String senderId, String text) async {
  final messageRef = await firestore
      .collection('chats')
      .doc(chatId)
      .collection('messages')
      .doc(messageId)
      .set({
    'senderId': senderId,
    'text': text,
    "timestamp": FieldValue.serverTimestamp(),
  });
}
Future<void> main() async{
  /////create new chat////
  final chatRef = await creatChat('chatId', {'user1': true, 'user2': true} );

  /// add message to the chat//
  await addMessage(chatRef.id, 'messageId1', 'user1', 'Hi there');
  await addMessage(chatRef.id, 'messageId2', 'user2', 'Hi hw arrrr yuoo');

}