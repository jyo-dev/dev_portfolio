import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CurvedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Clip drawing to the container's bounds.
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));

    final paint = Paint()
      ..color = Colors.deepPurpleAccent
      ..strokeWidth = 40
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    //----------------------------------------------------------------
    // Horizontal Wavy Line
    //----------------------------------------------------------------
    // Save the canvas state.
    canvas.save();

    // Adjust the vertical offset so that the horizontal wave sits in the center.
    // For instance, using size.height * 0.5 centers it vertically.
    final verticalOffset = size.height * 0.5;
    canvas.translate(0, verticalOffset);

    final horizontalPath = Path();
    // These coordinates are relative to the translated canvas.
    horizontalPath.moveTo(-100, size.height * 0.1);
    horizontalPath.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.2,
      size.width * 0.6,
      size.height * 0.1,
    );
    horizontalPath.quadraticBezierTo(
      size.width * 0.9,
      0,
      size.width + 100,
      size.height * 0.3,
    );
    canvas.drawPath(horizontalPath, paint);

    // Restore the canvas so the next drawing isn't affected.
    canvas.restore();

    //----------------------------------------------------------------
    // Vertical Wavy Line
    //----------------------------------------------------------------
    // Center this wave horizontally.
    final verticalPath = Path();
    final centerX = size.width / 2;

    // Starting from the top center.
    verticalPath.moveTo(centerX, 0);

    // Create a vertical wave using quadratic beziers.
    verticalPath.quadraticBezierTo(
      centerX + 30,
      size.height * 0.25,
      centerX,
      size.height * 0.5,
    );
    verticalPath.quadraticBezierTo(
      centerX - 30,
      size.height * 0.75,
      centerX,
      size.height,
    );
    canvas.drawPath(verticalPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
