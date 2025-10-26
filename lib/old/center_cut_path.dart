// import 'package:flutter/cupertino.dart';
//
// class CenterCutPath extends CustomClipper<Path> {
//   final BorderRadius borderRadius;
//   final double thickness;
//
//   CenterCutPath({
//     required this.borderRadius,
//     this.thickness = 1,
//   });
//
//   @override
//   Path getClip(Size size) {
//     // Define the inner rectangle with the specified thickness
//     final double width = size.width - thickness * 2;
//     final double height = size.height - thickness * 2;
//
//     // Create the inner RRect with the specified border radius
//     final innerRRect = RRect.fromRectAndCorners(
//       Rect.fromLTWH(thickness, thickness, width, height),
//       topLeft: borderRadius.topLeft,
//       topRight: borderRadius.topRight,
//       bottomLeft: borderRadius.bottomLeft,
//       bottomRight: borderRadius.bottomRight,
//     );
//
//     // Create the outer rectangle (full size)
//     final outerRect = Rect.fromLTWH(0, 0, size.width, size.height);
//
//     // Use Path.combine to create a cut-out effect
//     final path = Path.combine(
//       PathOperation.difference,
//       Path()..addRect(outerRect),
//       Path()..addRRect(innerRRect),
//     );
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CenterCutPath oldClipper) {
//     return oldClipper.borderRadius != borderRadius ||
//         oldClipper.thickness != thickness;
//   }
// }
