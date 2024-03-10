import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late final StateMachineController _stateMachineController;

  void _onInit(Artboard artboard) {
    _stateMachineController =
        StateMachineController.fromArtboard(artboard, "state")!;
    artboard.addController(_stateMachineController);
  }

  void _togglePanel() {
    final input = _stateMachineController.findInput<bool>('panelActive')!;

    input.change(!input.value);
  }

  @override
  void dispose() {
    _stateMachineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Grimly Panel'),
        elevation: 0,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 400,
            width: double.infinity,
            child: RiveAnimation.asset(
              'assets/animations/old-man-animation.riv',
              artboard: "main",
              stateMachines: const ["state"],
              onInit: _onInit,
              fit: BoxFit.fill,
            ),
          ),
          ElevatedButton(onPressed: _togglePanel, child: const Text('버튼'))
        ],
      ),
    );
  }
}
