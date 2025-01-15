# Gradient Glow Border

[![pub package](https://img.shields.io/pub/v/gradient_glow_border.svg)](https://pub.dev/packages/gradient_glow_border)
<a href="https://pub.dev/packages/gradient_glow_border/score"><img src="https://img.shields.io/pub/likes/gradient_glow_border" alt="likes"></a>
<a href="https://pub.dev/packages/gradient_glow_border/score"><img src="https://img.shields.io/pub/points/gradient_glow_border" alt="pub points"></a>
[![GitHub stars](https://img.shields.io/github/stars/mohamedelbaiomy/gradient_glow_border?style=flat&color=red)](https://github.com/mohamedelbaiomy/gradient_glow_border/stargazers)

A Flutter package for creating stunning animated gradient borders with support for normal, dashed, and dotted styles. This package allows you to easily add animated borders to your widgets with customizable colors, radius, thickness, and animation effects.

## Features
- Animated Gradient Borders: Create smooth, animated gradient borders around any widget.

- Customizable Border Styles:

    - Normal Gradient: A solid animated gradient border.
    - Dashed Gradient: A dashed animated gradient border with customizable dash spacing.
    - Dotted Gradient: A dotted animated gradient border with customizable dot spacing.

- Custom Border Radius: Apply different border radii to each corner of the border.
- Glow Effect: Add a glowing shadow effect to the border.
- Fully Customizable: Control the animation duration, gradient colors, thickness, and more.

## Installation
Add the package to your `pubspec.yaml` file:
```
dependencies:
  gradient_glow_border: ^1.0.3
```
Then, run flutter pub get to install the package.

## Usage
1) Normal Gradient Border
   Use the `GradientGlowBorder.normalGradient` constructor to create a solid animated gradient border:

```
GradientGlowBorder.normalGradient(
  borderRadius: BorderRadius.circular(15),
  blurRadius: 1,
  spreadRadius: 1,
  colors: [Colors.blue, Colors.red],
  glowOpacity: 1,
  duration: Duration(milliseconds: 800),
  thickness: 3,
  child: YourChildWidget(),
)
```
![Normal Gradient](https://github.com/mohamedelbaiomy/animated_border/blob/master/assets/1.gif?raw=true)

2) Dashed Gradient Border
   Use the `GradientGlowBorder.dashedGradient` constructor to create a dashed animated gradient border:

```
GradientGlowBorder.dashedGradient(
  borderRadius: BorderRadius.circular(15),
  blurRadius: 1,
  spreadRadius: 0,
  colors: [Colors.blue, Colors.red],
  glowOpacity: 1,
  duration: Duration(milliseconds: 800),
  thickness: 3,
  dashSpace: 5, // Space between dashes
  child: YourChildWidget(),
)
```

![Dashed Gradient](https://github.com/mohamedelbaiomy/animated_border/blob/master/assets/2.gif?raw=true)

3) Dotted Gradient Border
   Use the `GradientGlowBorder.dottedGradient` constructor to create a dotted animated gradient border:

```
GradientGlowBorder.dottedGradient(
  borderRadius: BorderRadius.circular(20),
  blurRadius: 1,
  spreadRadius: 0,
  colors: [Colors.blue, Colors.red],
  glowOpacity: 1,
  duration: Duration(milliseconds: 800),
  thickness: 3,
  dottedSpace: 5, // Space between dots
  child: YourChildWidget(),
)
```

![Dotted Gradient](https://github.com/mohamedelbaiomy/animated_border/blob/master/assets/3.gif?raw=true)

## Quick reference
Since customization requires a lot of properties, here is a quick cheatsheet:

| Parameter      | Type           | What does it do                                     |
|----------------|----------------|-----------------------------------------------------|
| `borderRadius` | `BorderRadius` | The border radius for each corner of the border.    |
| `spreadRadius` | `double`       | The spread radius of the glow effect.               |
| `glowOpacity`  | `double`       | The opacity of the glow effect.                     |
| `dottedSpace`  | `double`       | The space between dots (only for dotted borders).   |
| `dashSpace`    | `double`       | The space between dashes (only for dashed borders). |
| `blurRadius`   | `double`       | The blur radius of the glow effect.                 |
| `duration`     | `Duration`     | The duration of the animation.                      |
| `thickness`    | `double`       | The thickness of the border.                        |
| `colors`       | `List<Color>`  | The list of colors for the gradient.                |
| `child`        | `Widget?`      | The child widget to apply the animated border to.   |

## Example
Here’s a complete example of using the `GradientGlowBorder` package:

```
import 'package:flutter/material.dart';
import 'package:gradient_glow_border/gradient_glow_border.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SizedBox(
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
        ),
      ),
    );
  }
}

```

## Contributing
Contributions are welcome! If you find a bug or have a feature request, please open an issue. If you'd like to contribute code, feel free to submit a pull request.

## License
This project is licensed under the MIT License. See the **[LICENSE](https://pub.dev/packages/gradient_glow_border/license)** file for details

## 🔗 Mohamed Elbaiomy

* [![linkedin](https://img.shields.io/static/v1?message=LinkedIn&logo=linkedin&label=&color=0077B5&logoColor=white&labelColor=&style=for-the-badge%22%20height=%2235%22%20alt=%22linkedin%20logo%22)](https://www.linkedin.com/in/mohamed-elbaiomy262003/)
* [![youtube](https://img.shields.io/static/v1?message=Youtube&logo=youtube&label=&color=FF0000&logoColor=white&labelColor=&style=for-the-badge%22height=%2235%22alt=%22youtube%20logo%22)](https://www.youtube.com/@mohamedelbaiomy262)
* [![facebook](https://img.shields.io/static/v1?message=Facebook&logo=facebook&label=&color=1877F2&logoColor=white&labelColor=&style=for-the-badge%22%20height=%2235%22%20alt=%22facebook%20logo%22)](https://www.facebook.com/Original262003)
