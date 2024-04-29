
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tms/common_widgets/login_screen/textfield.dart';

import '../../../components/chat_bubble.dart';
import '../../../services/auth/auth_services.dart';
import '../../../services/chat/chat_services.dart';

class ChatPage extends StatefulWidget {
  final String receiverEmail;
  final String receiverID;

  ChatPage({super.key, required this.receiverEmail, required this.receiverID, required imageUrl});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //text controller
  final TextEditingController _messageController = TextEditingController();

  //chat & auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  //for textfield focus
  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    //add listeners to focus node
    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
        //cause a delay so that the keyboard has time to show up
        //then the amount of remaining space will be calculated,
        //then scroll down
        Future.delayed(const Duration(milliseconds: 500),
                () => scrollDown());
      }
    });

    //wait a bit for listview to be built, then scroll to bottom
    Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
          () => scrollDown(),
    );
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    _messageController.dispose();
    super.dispose();
  }

  //scroll controller
  final ScrollController _scrollController = ScrollController();

  void scrollDown() {
    _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn);
  }

  //send message
  void sendMessage() async {
    // if there is something inside the textfield
    if (_messageController.text.isNotEmpty) {
      // send the message
      await _chatService.sendMessage(
          widget.receiverID, _messageController.text);

      //clear text controller
      _messageController.clear();
    }
    scrollDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 45),
          child: Text(
            widget.receiverEmail,

          ),
        ),

        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Column(
        children: [
          //display all messages
          Expanded(child: _buildMessageList()),

          //user input
          _buildUserInput(),
        ],
      ),

    );
  }

  //build message list
  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatService.getMessages(widget.receiverID, senderID),
        builder: (context, snapshot) {
          //errors
          if (snapshot.hasError) {
            return const Text("Error");
          }

          //loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }

          //return list view
          return ListView(
            controller: _scrollController,
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList(),
          );
        });
  }

//build message item
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    //is current user
    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;


    //align message to the right if sender is the current user ,otherwise left
    var alignment =
    isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment: isCurrentUser
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            ChatBubble(message: data["message"], isCurrentUser: isCurrentUser),

            // Text(data["message"]),
          ],
        ));


    return Text(data["messages"]);
  }

//build message input
  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0, left: 20, right: 10),
      child: Row(
        children: [

          Expanded(
              child: Textfield(
                controller: _messageController,
                hintText: "Type a message",
                obscureText: false,
                focusNode: myFocusNode,)),
          SizedBox(width: 10,),

          //send button
          Container(
            decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle
            ),
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: sendMessage,
                icon: const Icon(Icons.arrow_upward, color: Colors.white,)),
          )
        ],
      ),
    );
  }
}
