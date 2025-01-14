import 'package:animated_border/animated_border.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Border',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: TestAnimatedBorder(),
    );
  }
}

class TestAnimatedBorder extends StatefulWidget {
  const TestAnimatedBorder({super.key});

  @override
  State<TestAnimatedBorder> createState() => _TestAnimatedBorderState();
}

class _TestAnimatedBorderState extends State<TestAnimatedBorder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Border"),
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
                child: AnimatedBorder.normalGradient(
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
                child: AnimatedBorder.dashedGradient(
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
                child: AnimatedBorder.dottedGradient(
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
                child: AnimatedBorder.dashedGradient(
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
