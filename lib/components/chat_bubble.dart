
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Themes/themes_provider.dart';


class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const ChatBubble(
      {super.key, required this.message, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    //light vs dark mode for correct bubble color
    bool isDarkMode = Provider
        .of<ThemeProvider>(context, listen: false)
        .isDarkMode;
    return Container(
      decoration: BoxDecoration(
          color: isCurrentUser ?
          (isDarkMode ? Colors.green.shade600 : Colors.green.shade600):
          (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade600),
          borderRadius: BorderRadius.circular(14)
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 25),
      child: Text(
        message,
        style: TextStyle(
          color: isCurrentUser ? Colors.white :(
              isDarkMode ? Colors.white : Colors.white),
        ),
      ),
    );
  }
}
