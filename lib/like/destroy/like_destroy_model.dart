import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_xb2/app/app_config.dart';
import 'package:flutter_xb2/app/app_service.dart';
import 'package:flutter_xb2/app/exceptions/http_exception.dart';

class LikeDestroyModel extends ChangeNotifier {
  final AppService appService;

  LikeDestroyModel({required this.appService});

  /// 取消用户点赞
  deleteUserLikePost(int postId) async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/posts/$postId/like');

    final response = await appService.apiHttpClient.delete(uri);
    final responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      notifyListeners();
    } else {
      throw HttpException(responseBody['message']);
    }
  }
}
