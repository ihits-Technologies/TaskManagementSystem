// pie_chart_indicator.dart

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:tms/app_colors/app_colors.dart';

class PieChartIndicator extends StatelessWidget {
  final double completedPercentage;
  final double pendingPercentage;
  final double overduePercentage;

  PieChartIndicator({
    required this.completedPercentage,
    required this.pendingPercentage,
    required this.overduePercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      child: Stack(
        children: [
          Positioned.fill(
            child: CircularProgressIndicator(
              value: 1.0,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[300]!),
              backgroundColor: Colors.transparent,
              strokeWidth: 20, // Adjust the border width
            ),
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: _PieChartPainter(
                completedPercentage: completedPercentage,
                pendingPercentage: pendingPercentage,
                overduePercentage: overduePercentage,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class _PieChartPainter extends CustomPainter {
  final double completedPercentage;
  final double pendingPercentage;
  final double overduePercentage;

  _PieChartPainter({
    required this.completedPercentage,
    required this.pendingPercentage,
    required this.overduePercentage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2);
    final paint = Paint()
      ..strokeWidth = 20 // Adjust the border width
      ..style = PaintingStyle.stroke;

    double gapSize = 0.02;

// Draw completed section with a gap
    paint.color = AppColors.completedColor;
    canvas.drawArc(
      rect,
      gapSize, // Small gap at the beginning
      2 * pi * (completedPercentage / 100) - 2 * gapSize, // Adjusted sweep angle to create a gap at the end
      false,
      paint,
    );

// Draw pending section with a gap
    paint.color = AppColors.pendingColor;
    canvas.drawArc(
      rect,
      2 * pi * ((completedPercentage + gapSize) / 100) + gapSize, // Starting point after the gap
      2 * pi * (pendingPercentage / 100) - 2 * gapSize, // Adjusted sweep angle to create a gap at the end
      false,
      paint,
    );

// Draw overdue section with a gap
    paint.color = AppColors.overdueColor;
    canvas.drawArc(
      rect,
      2 * pi * ((completedPercentage + pendingPercentage + gapSize) / 100) + gapSize, // Starting point after the gap
      2 * pi * (overduePercentage / 100) - 2 * gapSize, // Adjusted sweep angle to create a gap at the end
      false,
      paint,
    );


  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
