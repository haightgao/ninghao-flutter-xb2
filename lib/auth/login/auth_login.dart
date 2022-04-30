import 'package:flutter/material.dart';
import 'package:flutter_xb2/auth/login/components/auth_login_form.dart';

class AuthLogin extends StatelessWidget {
  const AuthLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('用户登录'),
      ),
      body: AuthLoginForm(),
    );
  }
}
