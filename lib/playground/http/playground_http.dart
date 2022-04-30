import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_xb2/app/app_config.dart';
import 'package:flutter_xb2/user/user.dart';
import 'package:http/http.dart' as http;

class PlaygroundHttp extends StatefulWidget {
  const PlaygroundHttp({Key? key}) : super(key: key);

  @override
  State<PlaygroundHttp> createState() => _PlaygroundHttpState();
}

class _PlaygroundHttpState extends State<PlaygroundHttp> {
  String? currentUserName;

  String? currentUserToken;

  getUser() async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/users/74');
    final response = await http.get(uri);

    print('状态码: ${response.statusCode}');
    print('响应主体：${response.body}');

    if (response.statusCode == 200) {
      final user = User.fromJson(response.body);
      print('解码之后的响应主体：$user');
      print('用户名：${user.name}');
    }
  }

  createUser() async {
    final name = 'haight01';
    final password = '123456';
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/users');

    final response = await http.post(uri, body: {'name': name, 'password': password});

    print('状态码: ${response.statusCode}');
    print('响应主体：${response.body}');
  }

  updateUser() async {
    final name = 'haight01';
    final password = '123456';
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/users');

    final headers = {
      HttpHeaders.authorizationHeader: 'Bearer $currentUserToken',
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    final body = jsonEncode({
      'validate': {
        'password': password,
      },
      'update': {'name': name}
    });

    final response = await http.patch(uri, headers: headers, body: body);

    print('状态码: ${response.statusCode}');
    print('响应主体：${response.body}');
  }

  login() async {
    final name = 'haight';
    final password = '123456';
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/login');

    final response = await http.post(uri, body: {'name': name, 'password': password});

    print('状态码: ${response.statusCode}');
    print('响应主体：${response.body}');

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      setState(() {
        currentUserName = responseBody['name'];
        currentUserToken = responseBody['token'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentUserName ?? '未登录',
            style: Theme.of(context).textTheme.headline6,
          ),
          ElevatedButton(
            onPressed: getUser,
            child: const Text('发送请求'),
          ),
          ElevatedButton(
            onPressed: createUser,
            child: const Text('创建用户'),
          ),
          ElevatedButton(
            onPressed: login,
            child: const Text('用户登录'),
          ),
          ElevatedButton(
            onPressed: updateUser,
            child: const Text('更新用户'),
          ),
        ],
      ),
    );
  }
}
