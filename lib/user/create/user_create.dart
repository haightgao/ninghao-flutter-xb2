import 'package:flutter/material.dart';
import 'package:flutter_xb2/user/create/components/user_create_form.dart';

class UserCreate extends StatelessWidget {
  const UserCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('注册用户'),
      ),
      body: UserCreateForm(),
    );
  }
}
