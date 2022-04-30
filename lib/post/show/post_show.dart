import 'package:flutter/material.dart';
import 'package:flutter_xb2/app/components/app_no_content.dart';
import 'package:flutter_xb2/post/show/post_show_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_xb2/post/post.dart';
import 'package:flutter_xb2/post/show/components/post_show_main.dart';

class PostShow extends StatefulWidget {
  final String postId;
  final Post? post;

  const PostShow({Key? key, required this.postId, required this.post}) : super(key: key);

  @override
  State<PostShow> createState() => _PostShowState();
}

class _PostShowState extends State<PostShow> {
  @override
  void initState() {
    super.initState();
    if (widget.post == null) {
      context.read<PostShowModel>().getPostById(widget.postId);
    }
  }

  @override
  Widget build(BuildContext context) {
    Post? post = widget.post;

    if (widget.post == null) {
      post = context.watch<PostShowModel>().post;
    }
    return Scaffold(
      body: post != null
          ? PostShowMain(
              post: post,
            )
          : const AppNoContent(),
    );
  }
}
