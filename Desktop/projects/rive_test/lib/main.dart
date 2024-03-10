import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RiveScreen(),
    );
  }
}

class RiveScreen extends StatefulWidget {
  const RiveScreen({super.key});

  @override
  State<RiveScreen> createState() => _RiveScreenState();
}

class _RiveScreenState extends State<RiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Rive Animation',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          const RiveAnimation.asset(
            'assets/animations/balls_pingpong.riv',
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20,
                sigmaY: 20,
              ),
              child: const Center(
                child: Text(
                  'Welcome to Rive',
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
      // Scaffold의 body에 Rive 애니메이션 위젯을 추가합니다.
    );
  }
}
