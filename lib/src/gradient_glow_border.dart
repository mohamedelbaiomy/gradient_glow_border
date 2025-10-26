import 'package:flutter/material.dart';
import 'package:gradient_glow_border/src/clippers/border_clipper.dart';
import 'package:gradient_glow_border/src/enums/border_style_enum.dart';
import 'package:gradient_glow_border/src/models/border_config.dart';
import 'package:gradient_glow_border/src/pointers/border_pointer.dart';

/// A widget that displays an animated gradient border with optional glow effect
class GradientGlowBorder extends StatefulWidget {
  /// Configuration for the border
  final BorderConfig config;

  /// The child widget to wrap with the border
  final Widget? child;

  const GradientGlowBorder({
    super.key,
    required this.config,
    this.child,
  });

  /// Creates a solid gradient border
  factory GradientGlowBorder.solid({
    Key? key,
    required BorderRadius borderRadius,
    required List<Color> colors,
    double thickness = 2.0,
    double blurRadius = 8.0,
    double spreadRadius = 0.0,
    double glowOpacity = 1.0,
    bool animate = true,
    Duration animationDuration = const Duration(seconds: 2),
    Curve animationCurve = Curves.linear,
    Widget? child,
  }) {
    return GradientGlowBorder(
      key: key,
      config: BorderConfig(
        borderRadius: borderRadius,
        colors: colors,
        thickness: thickness,
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
        glowOpacity: glowOpacity,
        borderStyle: BorderStyleEnum.solid,
        animate: animate,
        animationDuration: animationDuration,
        animationCurve: animationCurve,
      ),
      child: child,
    );
  }

  /// Creates a dashed gradient border
  factory GradientGlowBorder.dashed({
    Key? key,
    required BorderRadius borderRadius,
    required List<Color> colors,
    double thickness = 2.0,
    double spacing = 5.0,
    double dashLength = 10.0,
    bool animate = true,
    Duration animationDuration = const Duration(seconds: 2),
    Curve animationCurve = Curves.linear,
    Widget? child,
  }) {
    return GradientGlowBorder(
      key: key,
      config: BorderConfig(
        borderRadius: borderRadius,
        colors: colors,
        thickness: thickness,
        borderStyle: BorderStyleEnum.dashed,
        spacing: spacing,
        dashLength: dashLength,
        animate: animate,
        animationDuration: animationDuration,
        animationCurve: animationCurve,
      ),
      child: child,
    );
  }

  /// Creates a dotted gradient border
  factory GradientGlowBorder.dotted({
    Key? key,
    required BorderRadius borderRadius,
    required List<Color> colors,
    double thickness = 2.0,
    double spacing = 5.0,
    bool animate = true,
    Duration animationDuration = const Duration(seconds: 2),
    Curve animationCurve = Curves.linear,
    Widget? child,
  }) {
    return GradientGlowBorder(
      key: key,
      config: BorderConfig(
        borderRadius: borderRadius,
        colors: colors,
        thickness: thickness,
        borderStyle: BorderStyleEnum.dotted,
        spacing: spacing,
        animate: animate,
        animationDuration: animationDuration,
        animationCurve: animationCurve,
      ),
      child: child,
    );
  }

  @override
  State<GradientGlowBorder> createState() => _GradientGlowBorderState();
}

class _GradientGlowBorderState extends State<GradientGlowBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController? _controller;
  late Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
  }

  void _initializeAnimation() {
    if (widget.config.animate) {
      _controller = AnimationController(
        vsync: this,
        duration: widget.config.animationDuration,
      );

      _animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _controller!,
          curve: widget.config.animationCurve,
        ),
      );

      _controller!.repeat();
    } else {
      _controller = null;
      _animation = null;
    }
  }

  @override
  void didUpdateWidget(GradientGlowBorder oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.config.animate != widget.config.animate ||
        oldWidget.config.animationDuration != widget.config.animationDuration ||
        oldWidget.config.animationCurve != widget.config.animationCurve) {
      _controller?.dispose();
      _initializeAnimation();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Handle infinite constraints
        final width = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.of(context).size.width;
        final height = constraints.maxHeight.isFinite
            ? constraints.maxHeight
            : MediaQuery.of(context).size.height;

        final size = Size(width, height);

        return SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              // Child widget with clipped corners
              if (widget.child != null)
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: widget.config.borderRadius,
                    child: widget.child,
                  ),
                ),

              // Border layer
              Positioned.fill(
                child: widget.config.animate && _controller != null
                    ? AnimatedBuilder(
                        animation: _controller!,
                        builder: (context, _) =>
                            _buildBorder(size, _animation!.value),
                      )
                    : _buildBorder(size, 0),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBorder(Size size, double animationValue) {
    // For solid borders with glow effect
    if (widget.config.borderStyle == BorderStyleEnum.solid) {
      return ClipPath(
        clipper: BorderClipper(config: widget.config),
        child: Stack(
          children: [
            // Glow effect
            if (widget.config.blurRadius > 0)
              Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  borderRadius: widget.config.borderRadius,
                  boxShadow: [
                    BoxShadow(
                      color: widget.config.colors.first
                          .withOpacity(widget.config.glowOpacity),
                      blurRadius: widget.config.blurRadius,
                      spreadRadius: widget.config.spreadRadius,
                    ),
                  ],
                ),
              ),

            // Gradient border
            Container(
              decoration: BoxDecoration(
                borderRadius: widget.config.borderRadius,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: widget.config.colors,
                  transform: GradientRotation(animationValue * 2 * 3.14159),
                ),
              ),
            ),
          ],
        ),
      );
    }

    // For dashed and dotted borders
    BorderPainter painter;
    switch (widget.config.borderStyle) {
      case BorderStyleEnum.dashed:
        painter = DashedBorderPainter(
          config: widget.config,
          animationValue: animationValue,
        );
      case BorderStyleEnum.dotted:
        painter = DottedBorderPainter(
          config: widget.config,
          animationValue: animationValue,
        );
      default:
        painter = SolidBorderPainter(
          config: widget.config,
          animationValue: animationValue,
        );
    }

    return CustomPaint(
      size: size,
      painter: painter,
    );
  }
}
