import 'package:flutter/material.dart';

class DottedBorderPainter extends CustomPainter {
  final BorderRadius borderRadius;
  final double thickness;
  final Gradient gradient;
  final double dottedSpace;

  DottedBorderPainter({
    required this.borderRadius,
    required this.thickness,
    required this.gradient,
    required this.dottedSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      )
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0, 0, size.width, size.height),
          topLeft: borderRadius.topLeft,
          topRight: borderRadius.topRight,
          bottomLeft: borderRadius.bottomLeft,
          bottomRight: borderRadius.bottomRight,
        ),
      );

    // Adjust dash width for dotted borders (smaller dashes)
    final dashWidth = thickness; // Dots are equal to the thickness
    final pathMetrics = path.computeMetrics();

    for (final pathMetric in pathMetrics) {
      var start = 0.0;
      while (start < pathMetric.length) {
        final end = start + dashWidth;
        canvas.drawPath(
          pathMetric.extractPath(start, end),
          paint,
        );
        start += dashWidth + dottedSpace; // Use dottedSpace
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
