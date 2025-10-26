import 'package:gradient_glow_border/gradient_glow_border.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gradient Glow Border',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const TestGradientGlowBorder(),
    );
  }
}

class TestGradientGlowBorder extends StatefulWidget {
  const TestGradientGlowBorder({super.key});

  @override
  State<TestGradientGlowBorder> createState() => _TestGradientGlowBorderState();
}

class _TestGradientGlowBorderState extends State<TestGradientGlowBorder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gradient Glow Border'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Example 1: Solid animated gradient border
              SizedBox(
                height: 70,
                width: double.infinity,
                child: GradientGlowBorder.solid(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  blurRadius: 1,
                  colors: const [
                    Colors.blue,
                    Colors.red,
                  ],
                  animate: true,
                  animationCurve: Curves.linear,
                  animationDuration: const Duration(seconds: 2),
                  glowOpacity: 1,
                  spreadRadius: 0,
                  thickness: 3,
                  child: const Center(
                    child: Text('Mohamed Elbaiomy'),
                  ),
                ),
              ),
              // Example 2: Dashed border
              SizedBox(
                height: 70,
                width: double.infinity,
                child: GradientGlowBorder.dashed(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  colors: const [
                    Colors.blue,
                    Colors.red,
                  ],
                  animationDuration: const Duration(seconds: 2),
                  thickness: 3,
                  spacing: 5,
                  child: const Center(
                    child: Text('Mohamed Elbaiomy'),
                  ),
                ),
              ),
              // Example 3: Dotted border
              SizedBox(
                height: 70,
                width: double.infinity,
                child: GradientGlowBorder.dotted(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  colors: const [
                    Colors.blue,
                    Colors.red,
                  ],
                  animationDuration: const Duration(seconds: 2),
                  thickness: 3,
                  spacing: 5,
                  child: const Center(
                    child: Text('Mohamed Elbaiomy'),
                  ),
                ),
              ),
              // Example 4: Different border radius per corner
              SizedBox(
                height: 70,
                width: double.infinity,
                child: GradientGlowBorder.dashed(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(1),
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(1),
                  ),
                  spacing: 5,
                  colors: const [
                    Colors.red,
                    Colors.blue,
                  ],
                  animationDuration: const Duration(seconds: 2),
                  thickness: 3,
                  child: const Center(
                    child: Text('Mohamed Elbaiomy'),
                  ),
                ),
              ),
              // Example 5: Custom configuration
              SizedBox(
                height: 70,
                child: GradientGlowBorder(
                  config: BorderConfig(
                    borderRadius: BorderRadius.circular(24),
                    colors: const [
                      Color(0xFFFF6B6B),
                      Color(0xFFFFE66D),
                      Color(0xFF4ECDC4),
                      Color(0xFF556270),
                    ],
                    thickness: 4,
                    blurRadius: 16,
                    spreadRadius: 3,
                    glowOpacity: 0,
                    borderStyle: BorderStyleEnum.solid,
                    animate: true,
                    animationDuration: const Duration(seconds: 3),
                    animationCurve: Curves.easeInOut,
                  ),
                  child: const Center(
                    child: Text(
                      'Mohamed Elbaiomy',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
