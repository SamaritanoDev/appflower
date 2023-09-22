import 'dart:math';
import 'package:flutter/material.dart';

class SunflowerWidget extends StatelessWidget {
  const SunflowerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(200, 200), // Tamaño del widget de dibujo
      painter: SunflowerPainter(),
    );
  }
}

class SunflowerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height * 0.7);
    final petalRadius = size.width / 3;

    // Dibuja el tallo
    paint.color = Colors.green;
    paint.strokeWidth = 10.0;
    canvas.drawLine(center, Offset(center.dx, size.height * 2), paint);

    // Dibuja una hoja en el tallo
    paint.color = const Color.fromARGB(255, 32, 105, 37);
    final leafStart = center + Offset(0, size.height * 0.5);
    final leafControlPoint1 = center + Offset(70, size.height * 0.6);
    final leafEnd = center + Offset(0, size.height * 0.8);
    final leafControlPoint2 = center + Offset(-60, size.height * 0.6);
    final leafPath = Path()
      ..moveTo(leafStart.dx, leafStart.dy)
      ..cubicTo(
        leafControlPoint1.dx,
        leafControlPoint1.dy,
        leafControlPoint2.dx,
        leafControlPoint2.dy,
        leafEnd.dx,
        leafEnd.dy,
      );
    canvas.drawPath(leafPath, paint);

    // Dibuja el centro del girasol
    paint.color = Colors.black;
    canvas.drawCircle(center, petalRadius / 5, paint);

    // Dibuja los pétalos del girasol
    paint.color = Colors.yellow;
    for (int i = 0; i < 12; i++) {
      final angle = (i * 3 * pi) / 12;
      final petalOffset = Offset(
        center.dx + petalRadius * cos(angle),
        center.dy + petalRadius * sin(angle),
      );
      canvas.drawCircle(petalOffset, petalRadius / 2, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
