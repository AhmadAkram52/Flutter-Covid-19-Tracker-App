import 'dart:async';

import 'package:covid_tracker/View/world_stat_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const WorldStatScreen();
      }));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Stack(
                  children: [
                    RotationTransition(
                      turns: _animation,
                      child: Container(
                        transform: Matrix4.rotationZ(-20),
                        child: const Image(
                          image: AssetImage('assets/images/virus-1.png'),
                        ),
                      ),
                    ),
                    RotationTransition(
                      turns: _controller,
                      child: Container(
                        transform: Matrix4.rotationZ(-6),
                        child: const Image(
                          height: 150,
                          image: AssetImage('assets/images/virus-2.png'),
                        ),
                      ),
                    ),
                    RotationTransition(
                      turns: _animation,
                      child: Container(
                        transform: Matrix4.rotationZ(-4),
                        child: const Image(
                          height: 50,
                          image: AssetImage('assets/images/virus.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // const SizedBox(
            //   height: 100,
            // ),
            Expanded(
              child: Center(
                child: Stack(
                  children: [
                    RotationTransition(
                      turns: _animation,
                      child: Container(
                        transform: Matrix4.rotationZ(-1.4),
                        child: const Image(
                          height: 300,
                          image: AssetImage('assets/images/virus-3.png'),
                        ),
                      ),
                    ),
                    RotationTransition(
                      turns: _controller,
                      child: Container(
                        transform: Matrix4.rotationZ(-8),
                        child: const Image(
                          image: AssetImage('assets/images/virus-4.png'),
                        ),
                      ),
                    ),
                    RotationTransition(
                      turns: _controller,
                      child: Container(
                        transform: Matrix4.rotationZ(-6),
                        child: const Image(
                          image: AssetImage('assets/images/virus-4.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
