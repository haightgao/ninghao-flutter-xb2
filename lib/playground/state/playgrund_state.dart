import 'package:flutter/material.dart';
import 'package:flutter_xb2/auth/login/auth_login.dart';

class PlaygroundState extends StatelessWidget {
  const PlaygroundState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      child: const AuthLogin(),
    );
  }
}
