import 'package:flutter/material.dart';
import 'package:travelon/Style/ScaffoldStyle.dart';

class CircularProgressIndicatorCustom extends StatelessWidget {
  const CircularProgressIndicatorCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: whatIsDarkMode ? themeDark.primaryColor : themeLight.primaryColor,
    );
  }
}

class LinearProgressIndicatorCustom extends StatelessWidget {
  const LinearProgressIndicatorCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      color: whatIsDarkMode
          ? themeDark.primaryColor
          : themeLight.scaffoldBackgroundColor,
      backgroundColor: Colors.transparent,
    );
  }
}
