import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class SunflowerBouquetWidget extends StatefulWidget {
  const SunflowerBouquetWidget({super.key});

  @override
  State<SunflowerBouquetWidget> createState() => _SunflowerBouquetWidgetState();
}

class _SunflowerBouquetWidgetState extends State<SunflowerBouquetWidget> {
  List<int> visibleFlowers = [];

  @override
  void initState() {
    super.initState();

    // Inicia un temporizador para agregar flores cada medio segundo
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (visibleFlowers.length < 5) {
        setState(() {
          visibleFlowers.add(visibleFlowers.length);
        });
      } else {
        timer.cancel(); // Detiene el temporizador después de que se muestran las 5 flores
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(300, 300), // Tamaño del widget de dibujo
      painter: SunflowerBouquetPainter(visibleFlowers),
    );
  }
}

class SunflowerBouquetPainter extends CustomPainter {
  final List<int> visibleFlowers;

  SunflowerBouquetPainter(this.visibleFlowers);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.amberAccent
      ..style = PaintingStyle.fill;

    final stemPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 10.0;

    // Coordenadas del centro del ramo
    final bouquetCenterX = size.width / 2;
    final bouquetCenterY = size.height * 0.8;

    // Dibuja los girasoles visibles en el ramo
    for (int i in visibleFlowers) {
      final petalRadius = size.width / 15;

      // Calcula las coordenadas del centro de cada girasol
      final centerX = bouquetCenterX + (i - 2) * size.width / 6;
      final centerY = bouquetCenterY - (petalRadius * 2);

      final center = Offset(centerX, centerY);

      // Dibuja el tallo
      canvas.drawLine(center, Offset(bouquetCenterX, bouquetCenterY * 2), stemPaint);

      // Dibuja el centro del girasol
      paint.color = Colors.black;
      canvas.drawCircle(center, petalRadius / 2, paint);

      // Dibuja los pétalos del girasol
      paint.color = Colors.amberAccent;
      for (int j = 0; j < 12; j++) {
        final angle = (j * 3 * pi) / 12;
        final petalOffset = Offset(
          center.dx + petalRadius * cos(angle),
          center.dy + petalRadius * sin(angle),
        );
        canvas.drawCircle(petalOffset, petalRadius / 2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
