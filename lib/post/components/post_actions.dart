import 'package:flutter/material.dart';
import 'package:flutter_xb2/app/exceptions/http_exception.dart';
import 'package:flutter_xb2/like/create/like_create_model.dart';
import 'package:flutter_xb2/like/destroy/like_destroy_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_xb2/post/post.dart';

class PostActions extends StatelessWidget {
  final Post post;
  const PostActions({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final likeCreateModel = context.watch<LikeCreateModel>();
    final likeDestroyModel = context.watch<LikeDestroyModel>();

    increaseTotalLikes() {
      post.totalLikes = post.totalLikes! + 1;
    }

    decreaseTotalLikes() {
      post.totalLikes = post.totalLikes! != 0 ? post.totalLikes! - 1 : 0;
    }

    liked() {
      post.liked = 1;
      increaseTotalLikes();
    }

    unliked() {
      post.liked = 0;
      decreaseTotalLikes();
    }

    onTapLikeAction() async {
      if (post.liked == 0) {
        try {
          await likeCreateModel.createUserLikePost(post.id!);
          liked();
        } on HttpException catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
        }
      } else {
        try {
          await likeDestroyModel.deleteUserLikePost(post.id!);
          unliked();
        } on HttpException catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
        }
      }
    }

    final likeAction = Row(
      children: [
        GestureDetector(
          child: Icon(post.liked == 0 ? Icons.favorite_border_outlined : Icons.favorite),
          onTap: onTapLikeAction,
        ),
        if (post.totalLikes != 0)
          Container(
            padding: const EdgeInsets.only(left: 4),
            child: Text('${post.totalLikes}'),
          ),
      ],
    );
    final commentAction = Row(
      children: [
        const Icon(Icons.comment_outlined),
        if (post.totalComments != 0)
          Container(
            padding: const EdgeInsets.only(left: 4),
            child: Text('${post.totalComments}'),
          ),
      ],
    );

    return Container(
        child: Row(
      children: [
        likeAction,
        const SizedBox(width: 16),
        commentAction,
      ],
    ));
  }
}
