import 'package:flutter/material.dart';
import 'package:flutter_xb2/post/create/components/post_create_form.dart';

/// 添加文章页面
class PostCreate extends StatelessWidget {
  const PostCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: const SafeArea(
          child: PostCreateForm(),
        ),
      ),
    );
  }
}
