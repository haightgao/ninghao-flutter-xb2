import 'package:flutter/material.dart';
import 'package:flutter_xb2/post/components/post_content.dart';
import 'package:flutter_xb2/post/components/post_header.dart';
import 'package:flutter_xb2/post/components/post_media.dart';
import 'package:flutter_xb2/post/components/post_tags.dart';
import 'package:flutter_xb2/post/post.dart';

class PostShowMain extends StatelessWidget {
  final Post post;
  const PostShowMain({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final closeButton = MaterialButton(
      onPressed: () {
        Navigator.maybePop(context);
      },
      child: const Icon(
        Icons.close,
        size: 24,
        color: Colors.white60,
      ),
      color: Colors.black26,
      padding: const EdgeInsets.all(4),
      shape: const CircleBorder(),
      elevation: 0,
    );

    final postMedia = Stack(
      children: [
        PostMedia(post: post),
        Positioned(
          right: 0,
          top: 32,
          child: closeButton,
        )
      ],
    );

    final postHeader = Container(
      padding: const EdgeInsets.all(16),
      child: PostHeader(post: post),
    );

    const divider = Divider(
      height: 16,
      thickness: 1,
      indent: 16,
      endIndent: 16,
    );

    final postContent = Container(
      padding: const EdgeInsets.all(16),
      child: PostContent(post: post),
    );

    final postTags = Container(
      padding: const EdgeInsets.all(16),
      child: PostTags(
        tags: post.tags ?? [],
      ),
    );

    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            postMedia,
            postHeader,
            divider,
            if (post.content != null) postContent,
            if (post.tags != null) postTags,
          ],
        ),
      ),
    );
  }
}
