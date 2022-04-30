import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_xb2/app/app_config.dart';
import 'package:flutter_xb2/app/app_service.dart';
import 'package:flutter_xb2/post/post.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// 布局样式枚举
enum PostListLayout {
  /// 堆叠布局
  stack,

  /// 网格布局
  grid,
}

/// 文章列表Model
class PostIndexModel extends ChangeNotifier {
  List<Post>? posts;
  final AppService appService;
  PostListLayout? layout;

  PostIndexModel({
    required this.appService,
    this.posts,
    this.layout = PostListLayout.stack,
  });

  /// 修改布局
  setLayout(PostListLayout data) {
    layout = data;
    notifyListeners();
  }

  /// 存储布局
  storeLayout(PostListLayout data) async {
    setLayout(data);
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('postListLayout', data.toString());
  }

  List<Post> parsePosts(String responseBody) {
    // final List<Post> parsed = jsonDecode(responseBody).map<Post>((item) => Post.fromJson(item)).toList();
    final List<Post> parsed = jsonDecode(responseBody).map<Post>((item) => Post.fromJson(item)).toList();

    return parsed;
  }

  Future<List<Post>> getPosts({required String sort}) async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/posts?sort=$sort');

    final response = await appService.apiHttpClient.get(uri);

    final parsed = parsePosts(response.body);
    posts = parsed;
    notifyListeners();
    return parsed;
  }
}
