import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class TestScreen2 extends StatefulWidget {
  const TestScreen2({super.key});

  @override
  State<TestScreen2> createState() => _TestScreenState2();
}

class _TestScreenState2 extends State<TestScreen2> {
  late final StateMachineController _stateMachineController;

  void _onInit(Artboard artboard) {
    _stateMachineController =
        StateMachineController.fromArtboard(artboard, "State Machine 1")!;
    artboard.addController(_stateMachineController);
  }

  // void _togglePanel() {
  //   final input = _stateMachineController.findInput<bool>('panelActive')!;

  //   input.change(!input.value);
  // }

  void _changeHairColor(int colorNumber) {
    print("컬러넘버::$colorNumber");
    final smiInput = _stateMachineController.findInput<int>('Color Number');
    debugPrint('smiInput: $smiInput');
    if (smiInput != null) {
      smiInput.value = colorNumber;
    }
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
        title: const Text('User'),
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
              'assets/animations/user_character_test.riv',
              artboard: "User Character",
              stateMachines: const ["State Machine 1"],
              onInit: _onInit,
              fit: BoxFit.fill,
            ),
          ),
          ElevatedButton(
            onPressed: () => _changeHairColor(1),
            child: const Text('Change Hair Color to Blue'),
          )
        ],
      ),
    );
  }
}
