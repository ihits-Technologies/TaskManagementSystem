import 'package:flutter/material.dart';
import 'package:tms/services/auth/auth_services.dart';
import 'package:tms/services/chat/chat_services.dart';

import '../../../components/user_tile.dart';
import 'chat_page.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    String searchText = '';
    return Scaffold(


      body: _buildUserList(),
    );
  }

  // Build a user list
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        // Error handling
        if (snapshot.hasError) {
          return Center(child: Text("Error"));
        }
        // Loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        // Display user list
        return ListView(
          children: snapshot.data!.map<Widget>((userData) {
            return userData["email"] != _authService.getCurrentUser()
                ? _buildUserListItem(userData, context)
                : SizedBox.shrink(); // Hide current user
          }).toList(),
        );
      },
    );
  }

  // Build individual list tile for user
  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    return FutureBuilder(
      future: _chatService.getLastMessageTime(userData["uid"]),
      builder: (context, AsyncSnapshot<DateTime?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          final lastMessageTime = snapshot.data ?? DateTime.now();
          final userName = userData["uname"] ?? "Unknown";
          return UserTile(
            text: userName,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                    receiverEmail: userData["email"],
                    receiverID: userData["uid"],
                  ),
                ),
              );
            },
            lastMessageTime: lastMessageTime,
          );
        }
      },
    );
  }


}
