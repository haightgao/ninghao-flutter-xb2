import 'package:flutter/material.dart';
import 'package:flutter_xb2/app/app_model.dart';
import 'package:flutter_xb2/app/components/app_button.dart';
import 'package:flutter_xb2/app/components/app_header_text.dart';
import 'package:flutter_xb2/app/components/app_password_field.dart';
import 'package:flutter_xb2/app/components/app_text_field.dart';
import 'package:flutter_xb2/app/exceptions/http_exception.dart';
import 'package:flutter_xb2/auth/auth.dart';
import 'package:flutter_xb2/auth/auth_model.dart';
import 'package:flutter_xb2/user/create/user_create_model.dart';
import 'package:provider/provider.dart';

class UserCreateForm extends StatefulWidget {
  UserCreateForm({Key? key}) : super(key: key);

  @override
  State<UserCreateForm> createState() => _UserCreateFormState();
}

class _UserCreateFormState extends State<UserCreateForm> {
  String? name;

  String? password;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authMode = Provider.of<AuthModel>(context, listen: true);
    final appModel = context.read<AppModel>();
    final userCreateModel = context.read<UserCreateModel>();

    const header = AppHeaderText(data: '用户注册');

    final nameField = AppTextField(
        labelText: '用户',
        onChanged: (value) {
          name = value;
        });
    final passwordField = AppPasswordField(onChanged: (value) {
      password = value;
    });

    final submitButton = AppButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          try {
            await userCreateModel.createUser(name: name!, password: password!);
            await authMode.login(LoginData(name: name!, password: password!));
            appModel.setPageName('');
          } on HttpException catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
          }
        }
      },
      text: '确定注册',
    );

    return Container(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header,
            nameField,
            passwordField,
            submitButton,
          ],
        ),
      ),
    );
  }
}
