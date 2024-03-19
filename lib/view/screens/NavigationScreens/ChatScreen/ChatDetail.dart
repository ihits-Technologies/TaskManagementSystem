import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tms/services/firebase/firebase_service.dart';
import 'package:intl/intl.dart';

import '../../../../app_colors/app_colors.dart';

class ChatDetail extends StatefulWidget {
  final String chatId;
  final String chatName;
  final String chatImageUrl;

  const ChatDetail({
    Key? key,
    required this.chatId,
    required this.chatName,
    required this.chatImageUrl,
  }) : super(key: key);

  @override
  State<ChatDetail> createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.AppBarColor,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.chatImageUrl),
            ),
            SizedBox(width: 10),
            Text(
              widget.chatName,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _chatService.getMessagesStream(widget.chatId),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                var messages = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    var message = messages[index];
                    var messageText = message['text'];
                    var messageSender = message['senderId'];
                    var timestamp = message['timestamp'] ?? Timestamp.now(); // Retrieve the timestamp field
                    // Determine if the message is sent or received
                    bool isSentMessage = (messageSender == 'yourUserId');
                    return MessageBubble(
                      text: messageText,
                      isSentMessage: isSentMessage,
                      time: timestamp, // Pass the retrieved timestamp to the MessageBubble
                    );
                  },
                );
              },
            )

          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.AppBarColor,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.emoji_emotions),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Type your message',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      String text = _messageController.text.trim();
                      if (text.isNotEmpty) {
                        _chatService.sendMessage(
                          widget.chatId,
                          text,
                          'your UserId',
                        );
                        _messageController.clear();
                      }
                    },
                    icon: Icon(Icons.send),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


class MessageBubble extends StatelessWidget {
  final Timestamp time;
  final String text;
  final bool isSentMessage;

  const MessageBubble({
    Key? key,
    required this.text,
    required this.isSentMessage,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: isSentMessage
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: isSentMessage
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isSentMessage ? AppColors.AppBarColor : Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            DateFormat("HH:mm").format(time.toDate()),
            style: TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}


