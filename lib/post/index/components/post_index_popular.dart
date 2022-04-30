import 'package:flutter/material.dart';
import 'package:flutter_xb2/post/index/components/post_list.dart';

/// 热门文章
class PostIndexPopular extends StatelessWidget {
  const PostIndexPopular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const PostList(
        sort: 'most_comments',
      ),
    );
  }
}
