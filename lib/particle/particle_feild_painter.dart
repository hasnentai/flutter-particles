import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_particles/particle/particle.dart';

class ParticlePainter extends CustomPainter {
  Particle particle = Particle();
  ParticleField particleField;
  ParticlePainter({required this.particleField})
      : super(repaint: particleField);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();
    p.style = PaintingStyle.fill;

    for (Particle myParticle in particleField.particles) {
      p.color = Color.fromARGB(myParticle.alpha, 255, 25, 78);
      canvas.drawCircle(Offset(myParticle.x!, myParticle.y!), 3, p);
    }
  }

  @override
  bool shouldRepaint(ParticlePainter oldDelegate) => false;
}
