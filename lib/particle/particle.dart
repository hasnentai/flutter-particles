import 'dart:math';

import 'package:flutter/material.dart';

class Particle {
  double? x;
  double? y;
  double? vx;
  double? vy;
  int alpha;
  final Random _random = Random();
  double next(int min, int max) => _random.nextDouble() * (max - min) + min;
  Particle(
      {this.x = 500 / 2,
      this.y = 500 / 2,
      this.vx,
      this.vy,
      this.alpha = 255}) {
    vx = (vx ?? next(1, -1));
    vy = (vy ?? next(5, 1));
  }

  isDead() {
    return alpha < 1;
  }
}

class ParticleField extends ChangeNotifier {
  List<Particle> particles = [];
  int lastT = 0;
  double opacity = 1;
  final Random _random = Random();
  double next(int min, int max) => _random.nextDouble() * (max - min) + min;
  addParticle({x, y, w}) {
    for (int i = 0; i < 150; i++) {
      particles.add(Particle(
        x: x + i / 150 * w,
        y: y,
        vx: next(-5, 3),
        vy: next(-5, 1),
      ));
    }
  }

  void tick(Duration duration) {
    double t = min(1.5, (duration.inMilliseconds - lastT) / 1000 * 130);
    lastT = duration.inMilliseconds;
    //particles.add(Particle(x: 0, y: 0, vx: next(-1, 1), vy: next(-2, 1)));
    int l = particles.length;

    for (int i = l - 1; i >= 0; i--) {
      Particle o = particles[i];

      opacity <= 0 ? opacity = 0 : opacity = opacity - 0.0000001;
      o.vy = o.vy! + 0.05 * t;
      o.x = o.x! + o.vx! * t;
      o.y = o.y! + o.vy! * t;

      o.alpha <= 0 ? o.alpha = 0 : o.alpha--;
      if (particles[i].isDead()) {
        particles.removeAt(i);
      }
    }

    if (particles.isNotEmpty) {
      notifyListeners();
    }
  }
}
