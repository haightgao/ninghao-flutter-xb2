import 'package:flutter/material.dart';
import 'package:flutter_xb2/post/index/components/post_list.dart';

/// 最新文章
class PostIndexLatest extends StatelessWidget {
  const PostIndexLatest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const PostList(),
    );
  }
}
