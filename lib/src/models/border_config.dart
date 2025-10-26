import 'package:flutter/material.dart';

import '../enums/border_style_enum.dart';

/// Configuration class for gradient glow border
class BorderConfig {
  /// The border radius for each corner
  final BorderRadius borderRadius;

  /// The thickness of the border (default: 2.0)
  final double thickness;

  /// The blur radius of the glow effect (default: 8.0)
  final double blurRadius;

  /// The spread radius of the glow effect (default: 0.0)
  final double spreadRadius;

  /// The list of colors for the gradient
  final List<Color> colors;

  /// The opacity of the glow effect (0.0 to 1.0, default: 1.0)
  final double glowOpacity;

  /// The style of the border
  final BorderStyleEnum borderStyle;

  /// The space between dashes or dots (default: 5.0)
  final double spacing;

  /// The length of each dash (only used for dashed style, default: 10.0)
  final double dashLength;

  /// Whether the gradient should animate
  final bool animate;

  /// The duration of the animation (default: 2 seconds)
  final Duration animationDuration;

  /// The curve of the animation (default: Curves.linear)
  final Curve animationCurve;

  const BorderConfig({
    required this.borderRadius,
    required this.colors,
    this.thickness = 2.0,
    this.blurRadius = 8.0,
    this.spreadRadius = 0.0,
    this.glowOpacity = 1.0,
    this.borderStyle = BorderStyleEnum.solid,
    this.spacing = 5.0,
    this.dashLength = 10.0,
    this.animate = true,
    this.animationDuration = const Duration(seconds: 2),
    this.animationCurve = Curves.linear,
  }) : assert(thickness > 0, 'Thickness must be greater than 0'),
       assert(blurRadius >= 0, 'Blur radius must be non-negative'),
       assert(spreadRadius >= 0, 'Spread radius must be non-negative'),
       assert(
         glowOpacity >= 0 && glowOpacity <= 1,
         'Glow opacity must be between 0 and 1',
       ),
       assert(
         colors.length >= 2,
         'At least 2 colors are required for gradient',
       ),
       assert(spacing > 0, 'Spacing must be greater than 0'),
       assert(dashLength > 0, 'Dash length must be greater than 0');

  BorderConfig copyWith({
    BorderRadius? borderRadius,
    double? thickness,
    double? blurRadius,
    double? spreadRadius,
    List<Color>? colors,
    double? glowOpacity,
    BorderStyleEnum? borderStyle,
    double? spacing,
    double? dashLength,
    bool? animate,
    Duration? animationDuration,
    Curve? animationCurve,
  }) {
    return BorderConfig(
      borderRadius: borderRadius ?? this.borderRadius,
      thickness: thickness ?? this.thickness,
      blurRadius: blurRadius ?? this.blurRadius,
      spreadRadius: spreadRadius ?? this.spreadRadius,
      colors: colors ?? this.colors,
      glowOpacity: glowOpacity ?? this.glowOpacity,
      borderStyle: borderStyle ?? this.borderStyle,
      spacing: spacing ?? this.spacing,
      dashLength: dashLength ?? this.dashLength,
      animate: animate ?? this.animate,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BorderConfig &&
          runtimeType == other.runtimeType &&
          borderRadius == other.borderRadius &&
          thickness == other.thickness &&
          blurRadius == other.blurRadius &&
          spreadRadius == other.spreadRadius &&
          colors == other.colors &&
          glowOpacity == other.glowOpacity &&
          borderStyle == other.borderStyle &&
          spacing == other.spacing &&
          dashLength == other.dashLength &&
          animate == other.animate &&
          animationDuration == other.animationDuration &&
          animationCurve == other.animationCurve;

  @override
  int get hashCode => Object.hash(
    borderRadius,
    thickness,
    blurRadius,
    spreadRadius,
    Object.hashAll(colors),
    glowOpacity,
    borderStyle,
    spacing,
    dashLength,
    animate,
    animationDuration,
    animationCurve,
  );
}
