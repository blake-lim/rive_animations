import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_test/state_test.dart';
import 'package:rive_test/test_screen2.dart';

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
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Welcome to Rive',
                      style: TextStyle(
                          fontSize: 28.0, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 150),
                ],
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.center,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(20),
          //     ),
          //     width: 400,
          //     height: 100,
          //     child: const RiveAnimation.asset(
          //       'assets/animations/custom_button_animation.riv',
          //       stateMachines: ["state"],
          //     ),
          //   ),
          // ),
          // const Align(
          //   alignment: Alignment.center,
          //   child: Text(
          //     'Moving Test',
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 18.0,
          //       fontWeight: FontWeight.w700,
          //     ),
          //   ),
          // ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: const EdgeInsets.all(20.0),
          //     child: Column(
          //       mainAxisSize:
          //           MainAxisSize.min, // Column을 하단에 위치시키고, 내용물 크기만큼 조절
          //       children: [
          //         ElevatedButton(
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => const TestScreen()),
          //             );
          //           },
          //           child: const Text('Go to Test Screen'),
          //         ),
          //         const SizedBox(height: 10), // 버튼 사이의 간격
          //         ElevatedButton(
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => const TestScreen2()),
          //             );
          //           },
          //           child: const Text('Go to Test2 Screen'),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
