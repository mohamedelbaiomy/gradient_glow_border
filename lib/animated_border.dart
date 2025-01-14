import 'package:flutter/material.dart';
import 'center_cut_path.dart';
import 'dashed_border_painter.dart';
import 'dotted_border_painter.dart';

class AnimatedBorder extends StatefulWidget {
  final BorderRadius borderRadius;
  final double blurRadius;
  final double spreadRadius;
  final List<Color> colors;
  final double glowOpacity;
  final Duration duration;
  final double thickness;
  final bool dashed;
  final bool dotted;
  final double dashSpace;
  final double dottedSpace;
  final Widget? child;

  // Named constructor for normal gradient border
  const AnimatedBorder.normalGradient({
    super.key,
    required this.borderRadius,
    required this.blurRadius,
    required this.spreadRadius,
    required this.colors,
    required this.glowOpacity,
    required this.duration,
    required this.thickness,
    this.child,
  })  : dashed = false,
        dotted = false,
        dashSpace = 0.0,
        dottedSpace = 0.0;

  // Named constructor for dashed gradient border
  const AnimatedBorder.dashedGradient({
    super.key,
    required this.borderRadius,
    required this.blurRadius,
    required this.spreadRadius,
    required this.colors,
    required this.glowOpacity,
    required this.duration,
    required this.thickness,
    required this.dashSpace,
    this.child,
  })  : dashed = true,
        dotted = false,
        dottedSpace = 0.0;

  // Named constructor for dotted gradient border
  const AnimatedBorder.dottedGradient({
    super.key,
    required this.borderRadius,
    required this.blurRadius,
    required this.spreadRadius,
    required this.colors,
    required this.glowOpacity,
    required this.duration,
    required this.thickness,
    required this.dottedSpace,
    this.child,
  })  : dashed = false,
        dotted = true,
        dashSpace = 0.0;

  @override
  State<AnimatedBorder> createState() => _AnimatedBorderState();
}

class _AnimatedBorderState extends State<AnimatedBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _gradientAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _gradientAnimation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return Stack(
          children: [
            widget.child != null
                ? ClipRRect(
                    borderRadius: widget.borderRadius,
                    child: widget.child,
                  )
                : const SizedBox.shrink(),
            ClipPath(
              clipper: CenterCutPath(
                  borderRadius: widget.borderRadius,
                  thickness: widget.thickness),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, _) {
                  return Stack(
                    children: [
                      if (widget.dashed)
                        CustomPaint(
                          size: Size(constrains.maxWidth, constrains.maxHeight),
                          painter: DashedBorderPainter(
                            borderRadius: widget.borderRadius,
                            thickness: widget.thickness,
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: widget.colors,
                              transform: GradientRotation(
                                _gradientAnimation.value * 2 * 3.14159,
                              ),
                            ),
                            dashSpace: widget.dashSpace,
                          ),
                        ),
                      if (widget.dotted)
                        CustomPaint(
                          size: Size(constrains.maxWidth, constrains.maxHeight),
                          painter: DottedBorderPainter(
                            borderRadius: widget.borderRadius,
                            thickness: widget.thickness,
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: widget.colors,
                              transform: GradientRotation(
                                _gradientAnimation.value * 2 * 3.14159,
                              ),
                            ),
                            dottedSpace: widget.dottedSpace,
                          ),
                        ),
                      if (!widget.dashed && !widget.dotted)
                        Container(
                          width: constrains.maxWidth,
                          height: constrains.maxHeight,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: widget.borderRadius,
                            boxShadow: [
                              BoxShadow(
                                color: widget.colors.first,
                                offset: const Offset(0, 0),
                                blurRadius: widget.blurRadius,
                                spreadRadius: widget.spreadRadius,
                              ),
                            ],
                          ),
                        ),
                      if (!widget.dashed && !widget.dotted)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: widget.borderRadius,
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: widget.colors,
                              transform: GradientRotation(
                                _gradientAnimation.value * 2 * 3.14159,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
