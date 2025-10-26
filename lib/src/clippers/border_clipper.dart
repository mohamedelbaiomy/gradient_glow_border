import 'package:flutter/material.dart';
import '../models/border_config.dart';

/// Clipper that creates a frame effect by cutting out the center
class BorderClipper extends CustomClipper<Path> {
  final BorderConfig config;

  BorderClipper({required this.config});

  @override
  Path getClip(Size size) {
    final halfThickness = config.thickness / 2;

    // Outer rectangle
    final outerRect = Rect.fromLTWH(0, 0, size.width, size.height);

    // Inner rectangle (cut out area)
    final innerRect = Rect.fromLTWH(
      halfThickness,
      halfThickness,
      size.width - config.thickness,
      size.height - config.thickness,
    );

    // Create inner RRect with border radius
    final innerRRect = RRect.fromRectAndCorners(
      innerRect,
      topLeft: config.borderRadius.topLeft,
      topRight: config.borderRadius.topRight,
      bottomLeft: config.borderRadius.bottomLeft,
      bottomRight: config.borderRadius.bottomRight,
    );

    // Combine paths to create frame effect
    return Path.combine(
      PathOperation.difference,
      Path()..addRect(outerRect),
      Path()..addRRect(innerRRect),
    );
  }

  @override
  bool shouldReclip(covariant BorderClipper oldClipper) {
    return oldClipper.config != config;
  }
}
