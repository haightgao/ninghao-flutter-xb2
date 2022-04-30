import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_xb2/app/app_model.dart';
import 'package:flutter_xb2/app/app_provider.dart';
import 'package:flutter_xb2/app/components/app_about.dart';
import 'package:flutter_xb2/app/components/app_home.dart';
import 'package:flutter_xb2/app/router/app_route_information_parser.dart';
import 'package:flutter_xb2/app/router/app_router_delegate.dart';
import 'package:flutter_xb2/app/themes/app_theme.dart';
import 'package:flutter_xb2/auth/auth.dart';
import 'package:flutter_xb2/auth/auth_model.dart';
import 'package:flutter_xb2/auth/login/auth_login.dart';
import 'package:flutter_xb2/like/like_provider.dart';
import 'package:flutter_xb2/post/post_provider.dart';
import 'package:flutter_xb2/post/show/post_show.dart';
import 'package:flutter_xb2/post/show/post_show_model.dart';
import 'package:flutter_xb2/user/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppModel appModel = AppModel();
  final AuthModel authModel = AuthModel();

  bool initializing = true;

  initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final hasAuth = prefs.containsKey('auth');

    if (hasAuth) {
      final auth = Auth.fromJson(jsonDecode(prefs.getString('auth')!));

      authModel.setAuth(auth);
    }

    setState(() {
      initializing = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    if (initializing) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        home: const Scaffold(
          body: Center(
            child: Text('初始化...'),
          ),
        ),
      );
    }
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider<AuthModel>(create: (context) => authModel),
        // ChangeNotifierProvider<AppModel>(create: (context) => appModel),
        ChangeNotifierProvider.value(value: authModel),
        ChangeNotifierProvider.value(value: appModel),
        ...appProviders,
        ...postProviders,
        ...likeProviders,
        ...userProviders,
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        // 路由代理，返回一个Navigator
        routerDelegate: AppRouterDelegate(appModel),
        // 路由解析器，根据路由返回一个路由配置
        routeInformationParser: AppRouteInformationParser(),
      ),
    );
  }
}
