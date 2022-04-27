import 'package:flutter/material.dart';
import 'package:flutter_xb2/post/create/post_create.dart';
import 'package:flutter_xb2/post/index/post_index.dart';
import 'package:flutter_xb2/user/profile/user_profile.dart';

/// 主页面列表
class AppPageMain extends StatelessWidget {
  final int currentIndex;

  AppPageMain({Key? key, this.currentIndex = 0}) : super(key: key);

  final pageMain = [
    /// 发现
    const PostIndex(),

    /// 添加
    const PostCreate(),

    /// 用户
    const UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return pageMain.elementAt(currentIndex);
  }
}
