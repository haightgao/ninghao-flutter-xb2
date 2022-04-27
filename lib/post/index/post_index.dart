import 'package:flutter/material.dart';
import 'package:flutter_xb2/post/index/components/post_inde_latest.dart';
import 'package:flutter_xb2/post/index/components/post_index_popular.dart';

/// 发现页面
class PostIndex extends StatelessWidget {
  const PostIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        /// 最近文章
        PostIndexLatest(),

        /// 热门文章
        PostIndexPopular(),
      ],
    );
  }
}
