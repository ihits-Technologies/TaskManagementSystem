// announcements_box.dart
import 'package:flutter/material.dart';
import 'package:tms/app_colors/app_colors.dart';

class AnnouncementsBox extends StatelessWidget {
  final TextStyle headingStyle;
  final String title;
  final double boxWidth; // Add a property for width

  AnnouncementsBox({
    required this.headingStyle,
    required this.title,
    this.boxWidth =
        double.infinity, // Default to maximum width, can be adjusted
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: boxWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align to the top left
        children: [
          Text(
            title,
            style: headingStyle,
          ),
          const SizedBox(height: 8),
          Container(
            width:
                double.infinity, // Ensure the inner container takes full width
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: AppColors.appbarGradiaent
              , // Set the background color to cyan
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.announcement_rounded,
                  size: 68,
                  color: AppColors.announcementColor,
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
