import 'package:flutter/material.dart';
import 'package:flutter_xb2/app/app_model.dart';
import 'package:flutter_xb2/auth/auth_model.dart';
import 'package:provider/provider.dart';

/// 用户页面
class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appModel = context.read<AppModel>();
    final authModel = context.watch<AuthModel>();

    /// 登录按钮
    final login = TextButton(
      onPressed: () {
        appModel.setPageName('AuthLogin');
      },
      child: const Text('登录'),
    );

    /// 注册按钮
    final register = TextButton(
      onPressed: () {
        appModel.setPageName('UserCreate');
      },
      child: const Text('注册'),
    );

    /// 分隔
    final separator = Text('/');

    final actions = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        login,
        separator,
        register,
      ],
    );

    final userProfile = TextButton(
      onPressed: () {
        authModel.logout();
      },
      child: Text(authModel.name),
    );

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: authModel.isLoggedIn ? userProfile : actions,
      ),
    );
    ;
  }
}
