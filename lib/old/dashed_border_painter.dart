// import 'package:flutter/material.dart';
//
// class DashedBorderPainter extends CustomPainter {
//   final BorderRadius borderRadius;
//   final double thickness;
//   final Gradient gradient;
//   final double dashSpace;
//
//   DashedBorderPainter({
//     required this.borderRadius,
//     required this.thickness,
//     required this.gradient,
//     required this.dashSpace,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..shader = gradient.createShader(
//         Rect.fromLTWH(0, 0, size.width, size.height),
//       )
//       ..strokeWidth = thickness
//       ..style = PaintingStyle.stroke;
//
//     final path = Path()
//       ..addRRect(
//         RRect.fromRectAndCorners(
//           Rect.fromLTWH(0, 0, size.width, size.height),
//           topLeft: borderRadius.topLeft,
//           topRight: borderRadius.topRight,
//           bottomLeft: borderRadius.bottomLeft,
//           bottomRight: borderRadius.bottomRight,
//         ),
//       );
//
//     const dashWidth = 10.0; // Longer dashes for dashed borders
//     final pathMetrics = path.computeMetrics();
//
//     for (final pathMetric in pathMetrics) {
//       var start = 0.0;
//       while (start < pathMetric.length) {
//         final end = start + dashWidth;
//         canvas.drawPath(
//           pathMetric.extractPath(start, end),
//           paint,
//         );
//         start += dashWidth + dashSpace;
//       }
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
