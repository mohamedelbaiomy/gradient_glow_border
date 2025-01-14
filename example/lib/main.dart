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
    );
  }
}
