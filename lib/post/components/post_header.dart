import 'package:flutter/material.dart';
import 'package:flutter_xb2/post/components/post_actions.dart';
import 'package:flutter_xb2/post/post.dart';
import 'package:flutter_xb2/user/components/user_avatar.dart';

class PostHeader extends StatelessWidget {
  final Post post;
  const PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAvatar(postUser: post.user!),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title!,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  post.user!.name!,
                ),
              ],
            ),
          ),
          PostActions(post: post),
        ],
      ),
    );
  }
}
