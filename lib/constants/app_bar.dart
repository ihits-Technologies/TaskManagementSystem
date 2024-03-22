import 'package:flutter/material.dart';
import 'package:tms/constants/strings/strings.dart';

import 'colors/colors.dart';




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
              backgroundImage: const AssetImage('lib/Assets/Ellipse 186.png'),
              radius: screenWidth * 0.04,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            AppStrings.catherine,
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
