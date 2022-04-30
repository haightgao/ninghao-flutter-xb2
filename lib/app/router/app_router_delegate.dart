import 'package:flutter_xb2/auth/login/auth_login.dart';
import 'package:flutter_xb2/post/show/post_show.dart';
import 'package:flutter_xb2/post/show/post_show_model.dart';
import 'package:flutter_xb2/user/create/user_create.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xb2/app/app_model.dart';
import 'package:flutter_xb2/app/components/app_about.dart';
import 'package:flutter_xb2/app/router/app_route_configuration.dart';

import '../components/app_home.dart';

/// 路由器代理
class AppRouterDelegate extends RouterDelegate<AppRouteConfiguration> with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  // ignore: prefer_typing_uninitialized_variables
  final _navigatorKey;
  final AppModel appModel;

  AppRouterDelegate(this.appModel) : _navigatorKey = GlobalKey<NavigatorState>() {
    // 监听 appModel
    appModel.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appModel.removeListener(notifyListeners);
    super.dispose();
  }

  /// 动态构建Navigator
  @override
  Widget build(BuildContext context) {
    final postShowModel = context.read<PostShowModel>();

    return Navigator(
      // 调试状态下注释掉key，防止保存代码后返回首页
      // key: _navigatorKey,
      pages: [
        const MaterialPage(
          key: ValueKey('AppHome'),
          child: AppHome(),
        ),
        if (appModel.pageName == 'AppAbout')
          const MaterialPage(
            key: ValueKey('AppAbout'),
            child: AppAbout(),
          ),
        if (appModel.pageName == 'PostShow' && appModel.resourceId != null)
          MaterialPage(
            key: const ValueKey('PostShow'),
            child: PostShow(
              postId: appModel.resourceId!,
              post: postShowModel.post,
            ),
          ),
        if (appModel.pageName == 'AuthLogin')
          const MaterialPage(
            key: ValueKey('AuthLogin'),
            child: AuthLogin(),
          ),
        if (appModel.pageName == 'UserCreate')
          const MaterialPage(
            key: ValueKey('UserCreate'),
            child: UserCreate(),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        appModel.setPageName('');
        return true;
      },
    );
  }

  /// 获取 Navigator 使用的 key
  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  /// 当前路由配置
  /// 这个值提供给路由解析器（AppRouteInformationParser）的restoreRouteInformation方法使用，进行反向解析（生成url）
  @override
  AppRouteConfiguration? get currentConfiguration {
    if (appModel.pageName == 'AppAbout') {
      return AppRouteConfiguration.appAbout();
    }

    if (appModel.pageName == 'PostShow') {
      return AppRouteConfiguration.postShow(appModel.resourceId);
    }
    return AppRouteConfiguration.home();
  }

  /// 设置新路由地址
  /// 路由解析器返回的值，会传递到这个方法里
  /// 参数configuration 就是路由解析器传递来的值
  @override
  Future<void> setNewRoutePath(AppRouteConfiguration configuration) async {
    print('AppRouterDelegate/setNewRoutePath 设置新路由地址 ${configuration.pageName}');
    if (configuration.isHomePage) {
      appModel.setPageName('');
    }
    if (configuration.isAppAboutPage) {
      appModel.setPageName('AppAbout');
    }

    if (configuration.isPostShow) {
      appModel.setPageName('PostShow');
      appModel.setResourceId('${configuration.resourceId}');
    }
    return Future.value();
  }
}
