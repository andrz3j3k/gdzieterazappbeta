import 'package:flutter/material.dart';

class MiniGame extends StatefulWidget {
  const MiniGame({Key? key}) : super(key: key);

  @override
  State<MiniGame> createState() => _MiniGameState();
}

class _MiniGameState extends State<MiniGame> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('siemka'),
    );
  }
}
