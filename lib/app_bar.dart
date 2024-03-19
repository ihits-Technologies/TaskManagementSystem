import 'package:flutter/material.dart';

import 'core/colors/colors.dart';
import 'core/strings/strings.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showProfilePic;

  const CustomAppBar({
    required this.title,
    this.showProfilePic = true,
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      backgroundColor: appBarColor,
      title: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.01),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profilepic.png'),
              radius: screenWidth * 0.04,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            AppStrings.anupamaDetails,
            style: TextStyle(
              color: blackColor,
              fontSize: screenWidth * 0.04,
              fontFamily: 'Rubik',
              fontWeight: FontWeight.bold,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}