import 'package:flutter/material.dart';
import 'package:flutter_xb2/user/create/user_create.dart';

class PlaygroundInput extends StatelessWidget {
  const PlaygroundInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      child: const UserCreate(),
    );
  }
}
