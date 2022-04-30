import 'package:flutter/material.dart';

/// 应用Logo
class AppLogo extends StatelessWidget {
  final double size;
  final Color? color;
  const AppLogo({Key? key, this.size = 32, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _color;

    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    if (color == null) {
      _color = isDarkMode ? Colors.grey : Colors.black;
    } else {
      _color = color!;
    }
    return Image.asset(
      'assets/images/logo.png',
      width: 32,
      color: _color,
    );
  }
}
