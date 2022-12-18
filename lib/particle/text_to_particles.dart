import 'package:flutter/material.dart';
import 'package:flutter_particles/particle/particle.dart';

class TextToParticlePainter extends CustomPainter {
  ParticleField particleField = ParticleField();
  TextToParticlePainter({required this.particleField})
      : super(repaint: particleField);

  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(TextToParticlePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(TextToParticlePainter oldDelegate) => false;
}
