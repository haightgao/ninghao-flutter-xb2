import 'package:flutter/material.dart';

import 'app_route_configuration.dart';

/// 路由解析器
class AppRouteInformationParser extends RouteInformationParser<AppRouteConfiguration> {
  @override
  parseRouteInformation(RouteInformation routeInformation) async {
    print('setNewRoutePath/parseRouteInformation 解析路由信息 ${routeInformation.location}');
    final uri = Uri.parse(routeInformation.location ?? '');

    if (routeInformation.location == '/about') {
      final result = AppRouteConfiguration.appAbout();
      return result;
    }

    if (uri.pathSegments.length == 2 && uri.pathSegments[0] == 'posts') {
      return AppRouteConfiguration.postShow(uri.pathSegments[1]);
    }

    return AppRouteConfiguration.home();
  }

  /// 恢复路由信息（url）
  /// configuration的值来自 路由代理（AppRouterDelegate）的 currentConfiguration 方法返回的值
  @override
  RouteInformation? restoreRouteInformation(AppRouteConfiguration configuration) {
    if (configuration.isAppAboutPage) {
      return const RouteInformation(location: '/about');
    }

    if (configuration.isPostShow) {
      return RouteInformation(location: '/posts/${configuration.resourceId}');
    }

    return const RouteInformation(location: '/');
  }
}
