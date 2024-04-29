import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:tms/constants/colors/colors.dart';

class UserTile extends StatefulWidget {
  final String text;
  final void Function()? onTap;
  final DateTime lastMessageTime;
  final String? imageUrl;

  const UserTile({
    super.key,
    required this.text,
    required this.onTap,
    required this.lastMessageTime,
    this.imageUrl,
  });

  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            // Icon
            SizedBox(
              width: 68,
              height: 68,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: appBarColor,
                backgroundImage:widget.imageUrl != null ? NetworkImage(widget.imageUrl!) : null,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            // Username
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                widget.text,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Spacer(),
            // Last message time
            Container(
              width: 70,
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                DateFormat('mm').format(widget.lastMessageTime) + "m ago",
                style: const TextStyle(fontSize: 12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
