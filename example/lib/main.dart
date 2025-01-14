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
      home: TestGradientGlowBorder(),
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
        title: Text("Gradient Glow Border"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 70,
                width: double.infinity,
                child: GradientGlowBorder.normalGradient(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  blurRadius: 1,
                  colors: [
                    Colors.blue,
                    Colors.red,
                  ],
                  duration: Duration(milliseconds: 500),
                  glowOpacity: 1,
                  spreadRadius: 0,
                  thickness: 3,
                  child: Center(
                    child: Text("Mohamed Elbaiomy"),
                  ),
                ),
              ),
              SizedBox(
                height: 70,
                width: double.infinity,
                child: GradientGlowBorder.dashedGradient(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  blurRadius: 1,
                  colors: [
                    Colors.blue,
                    Colors.red,
                  ],
                  duration: Duration(milliseconds: 500),
                  glowOpacity: 1,
                  spreadRadius: 0,
                  thickness: 3,
                  dashSpace: 5,
                  child: Center(
                    child: Text("Mohamed Elbaiomy"),
                  ),
                ),
              ),
              SizedBox(
                height: 70,
                width: double.infinity,
                child: GradientGlowBorder.dottedGradient(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  blurRadius: 1,
                  colors: [
                    Colors.blue,
                    Colors.red,
                  ],
                  duration: Duration(milliseconds: 500),
                  glowOpacity: 1,
                  spreadRadius: 0,
                  thickness: 3,
                  dottedSpace: 5,
                  child: Center(
                    child: Text("Mohamed Elbaiomy"),
                  ),
                ),
              ),
              SizedBox(
                height: 70,
                width: double.infinity,
                child: GradientGlowBorder.dashedGradient(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(1),
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(1),
                  ),
                  dashSpace: 5,
                  blurRadius: 1,
                  colors: [
                    Colors.red,
                    Colors.blue,
                  ],
                  duration: Duration(milliseconds: 500),
                  glowOpacity: 1,
                  spreadRadius: 0,
                  thickness: 3,
                  child: Center(
                    child: Text("Mohamed Elbaiomy"),
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
