import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_particles/particle/particle.dart';
import 'package:flutter_particles/particle/particle_feild_painter.dart';

void main() {
  runApp(MaterialApp(home: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  ParticleField particleField = ParticleField();
  late double x;
  late double y;
  double opacity = 1;

  @override
  void initState() {
    _ticker = createTicker(particleField.tick)..start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          child: Stack(
            children: [
              CustomPaint(
                painter: ParticlePainter(particleField: particleField),
              ),
              Positioned(
                child: Opacity(
                  opacity: opacity,
                  child: MouseRegion(
                    onHover: (event) {
                      x = event.localPosition.dx;
                      y = event.localPosition.dy;
                    },
                    child: GestureDetector(
                      onTap: () => {
                        particleField.addParticle(x: x, y: y, w: 10),
                        particleField.addListener(
                          () => {
                            print(particleField.opacity),
                            setState(
                              () => {
                                opacity = particleField.opacity,
                              },
                            )
                          },
                        ),
                      },
                      child: Container(
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30)),
                        child: const Center(
                          child: const Text("Delete"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }
}
