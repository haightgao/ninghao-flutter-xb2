import 'package:flutter/material.dart';
import 'package:flutter_xb2/post/post.dart';

class PostContent extends StatelessWidget {
  final Post post;
  const PostContent({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        post.content!,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Theme.of(context).textTheme.bodyText1!.color,
        ),
      ),
    );
  }
}
