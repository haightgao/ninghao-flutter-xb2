import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_xb2/app/app_config.dart';
import 'package:flutter_xb2/post/post.dart';
import 'package:http/http.dart' as http;

class PostShowModel extends ChangeNotifier {
  Post? post;

  setPost(Post data) {
    post = data;
    notifyListeners();
  }

  Future<Post> getPostById(String postId) async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/posts/$postId');
    final response = await http.get(uri);
    final responseBody = jsonDecode(response.body);
    final parsed = Post.fromJson(responseBody);

    post = parsed;

    return parsed;
  }
}
