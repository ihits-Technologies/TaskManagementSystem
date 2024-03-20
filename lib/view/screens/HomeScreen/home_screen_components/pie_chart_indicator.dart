import 'package:flutter/material.dart';
import 'dart:math';
import 'package:get/get.dart';

import '../../../../constants/app_colors/app_colors.dart';
import '../../../../controllers/taskBox_controller/taskBoxController.dart';

class PieChartIndicator extends StatelessWidget {
  final double completedPercentage;
  final double pendingPercentage;
  final double overduePercentage;
  final int totalTasks;

  PieChartIndicator({
    required this.completedPercentage,
    required this.pendingPercentage,
    required this.overduePercentage,
    required this.totalTasks,
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
              strokeWidth: 20,
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
          Center(
            child: ShaderMask(
              shaderCallback: (bounds) => AppColors.totalTasksGradiant.createShader(bounds),
              child: Text(
                ' $totalTasks',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
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
  final TaskBoxController controller = Get.find<TaskBoxController>();

  _PieChartPainter({
    required this.completedPercentage,
    required this.pendingPercentage,
    required this.overduePercentage,
  });

  static const double smallGap = 0.03;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(
      center: size.center(Offset.zero),
      radius: size.width / 2,
    );
    final paint = Paint()
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke;

    _drawSection(canvas, rect, paint, controller.completedColor.value,
        completedPercentage, 0);
    _drawSection(canvas, rect, paint, controller.pendingColor.value,
        pendingPercentage, 2 * pi * (completedPercentage / 100) + smallGap);
    _drawSection(
        canvas,
        rect,
        paint,
        controller.overdueColor.value,
        overduePercentage,
        2 * pi * ((completedPercentage + pendingPercentage) / 100) + smallGap);
  }

  void _drawSection(Canvas canvas, Rect rect, Paint paint, Color color,
      double percentage, double startAngle) {
    paint.color = color;
    canvas.drawArc(
      rect,
      startAngle + smallGap,
      2 * pi * (percentage / 100) - 2 * smallGap,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}



