import 'package:flutter/material.dart';

class AppHeaderText extends StatelessWidget {
  final String data;
  const AppHeaderText({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 32),
      child: Text(
        data,
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
