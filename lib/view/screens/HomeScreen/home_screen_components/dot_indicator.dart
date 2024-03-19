// dot_indicator.dart

import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final Color color;

  DotIndicator({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
