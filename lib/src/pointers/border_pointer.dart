import 'package:flutter/material.dart';
import '../models/border_config.dart';

/// Base painter for all border styles
abstract class BorderPainter extends CustomPainter {
  final BorderConfig config;
  final double animationValue;

  BorderPainter({required this.config, required this.animationValue});

  @override
  bool shouldRepaint(covariant BorderPainter oldDelegate) {
    return oldDelegate.config != config ||
        oldDelegate.animationValue != animationValue;
  }

  /// Creates the border path
  Path createBorderPath(Size size) {
    return Path()..addRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(0, 0, size.width, size.height),
        topLeft: config.borderRadius.topLeft,
        topRight: config.borderRadius.topRight,
        bottomLeft: config.borderRadius.bottomLeft,
        bottomRight: config.borderRadius.bottomRight,
      ),
    );
  }

  /// Creates the gradient shader
  Shader createGradientShader(Size size) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: config.colors,
      transform: GradientRotation(animationValue * 2 * 3.14159),
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
  }
}

/// Painter for solid borders
class SolidBorderPainter extends BorderPainter {
  SolidBorderPainter({required super.config, required super.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = createGradientShader(size)
      ..strokeWidth = config.thickness
      ..style = PaintingStyle.stroke;

    canvas.drawPath(createBorderPath(size), paint);
  }
}

/// Painter for dashed borders
class DashedBorderPainter extends BorderPainter {
  DashedBorderPainter({required super.config, required super.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = createGradientShader(size)
      ..strokeWidth = config.thickness
      ..style = PaintingStyle.stroke;

    final path = createBorderPath(size);
    final pathMetrics = path.computeMetrics();

    for (final pathMetric in pathMetrics) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        final nextDistance = distance + config.dashLength;
        final extractPath = pathMetric.extractPath(
          distance,
          nextDistance > pathMetric.length ? pathMetric.length : nextDistance,
        );
        canvas.drawPath(extractPath, paint);
        distance = nextDistance + config.spacing;
      }
    }
  }
}

/// Painter for dotted borders
class DottedBorderPainter extends BorderPainter {
  DottedBorderPainter({required super.config, required super.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = createGradientShader(size)
      ..strokeWidth = config.thickness
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = createBorderPath(size);
    final pathMetrics = path.computeMetrics();
    final dotLength = config.thickness;

    for (final pathMetric in pathMetrics) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        final nextDistance = distance + dotLength;
        final extractPath = pathMetric.extractPath(
          distance,
          nextDistance > pathMetric.length ? pathMetric.length : nextDistance,
        );
        canvas.drawPath(extractPath, paint);
        distance = nextDistance + config.spacing;
      }
    }
  }
}
