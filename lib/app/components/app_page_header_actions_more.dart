import 'package:flutter/material.dart';
import 'package:flutter_xb2/post/index/post_index_model.dart';
import 'package:provider/provider.dart';

class AppPageHeaderActionsMore extends StatelessWidget {
  const AppPageHeaderActionsMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postIndexModel = context.watch<PostIndexModel>();

    return PopupMenuButton(
      icon: const Icon(Icons.more_horiz),
      offset: const Offset(0, 50),
      onCanceled: () {
        print('PopupMenuButton: onCanceled');
      },
      onSelected: (PostListLayout value) {
        postIndexModel.storeLayout(value);
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Icon(
            Icons.view_agenda_outlined,
            color: postIndexModel.layout == PostListLayout.stack ? Theme.of(context).primaryColor : null,
          ),
          value: PostListLayout.stack,
        ),
        PopupMenuItem(
          child: Icon(
            Icons.grid_view,
            color: postIndexModel.layout == PostListLayout.grid ? Theme.of(context).primaryColor : null,
          ),
          value: PostListLayout.grid,
        ),
      ],
    );
  }
}
