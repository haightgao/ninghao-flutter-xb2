import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_xb2/app/app_config.dart';
import 'package:flutter_xb2/app/app_service.dart';
import 'package:flutter_xb2/app/exceptions/http_exception.dart';

class LikeCreateModel extends ChangeNotifier {
  final AppService appService;

  LikeCreateModel({required this.appService});

  /// 用户点赞
  createUserLikePost(int postId) async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/posts/$postId/like');

    final response = await appService.apiHttpClient.post(uri);
    final responseBody = jsonDecode(response.body);
    if (response.statusCode == 201) {
      notifyListeners();
    } else {
      throw HttpException(responseBody['message']);
    }
  }
}
