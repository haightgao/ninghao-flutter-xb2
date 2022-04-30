import 'package:flutter/material.dart';
import 'package:flutter_xb2/post/post.dart';

class PostTags extends StatelessWidget {
  final List<PostTag> tags;

  const PostTags({Key? key, required this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: tags
            .map((tag) => Chip(
                  label: Text(tag.name!),
                ))
            .toList(),
      ),
    );
  }
}
