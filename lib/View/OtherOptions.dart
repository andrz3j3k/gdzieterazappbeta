import 'package:flutter/material.dart';

class OtherOptions extends StatefulWidget {
  const OtherOptions({Key? key}) : super(key: key);

  @override
  State<OtherOptions> createState() => _OtherOptions();
}

class _OtherOptions extends State<OtherOptions> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('opcje'),
    );
  }
}
