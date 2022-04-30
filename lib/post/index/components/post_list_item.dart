import 'package:flutter/material.dart';
import 'package:flutter_xb2/app/app_model.dart';
import 'package:flutter_xb2/post/components/post_header.dart';
import 'package:flutter_xb2/post/components/post_media.dart';
import 'package:flutter_xb2/post/index/post_index_model.dart';
import 'package:flutter_xb2/post/post.dart';
import 'package:flutter_xb2/post/show/post_show_model.dart';
import 'package:provider/provider.dart';

class PostListItem extends StatelessWidget {
  final Post item;
  final PostListLayout layout;
  const PostListItem({
    Key? key,
    required this.item,
    this.layout = PostListLayout.stack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appModel = context.read<AppModel>();
    final postShowModel = context.read<PostShowModel>();

    final postListItemMediaMask = Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          // 溅墨效果颜色
          splashColor: Colors.deepPurpleAccent.withOpacity(0.3),
          onTap: () {
            appModel.setPageName('PostShow');
            appModel.setResourceId('${item.id}');
            postShowModel.setPost(item);
          },
        ),
      ),
    );
    final postListItemMedia = Stack(
      fit: layout == PostListLayout.grid ? StackFit.expand : StackFit.loose,
      children: [
        PostMedia(post: item),
        postListItemMediaMask,
      ],
    );

    final stackListItem = Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          postListItemMedia,
          const SizedBox(height: 8),
          PostHeader(post: item),
        ],
      ),
    );

    final gridListItem = Container(
      child: postListItemMedia,
    );

    Widget postListItem = stackListItem;
    if (layout == PostListLayout.grid) {
      postListItem = gridListItem;
    }

    return postListItem;
  }
}
