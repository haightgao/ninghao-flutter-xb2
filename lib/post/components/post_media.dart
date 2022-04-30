import 'package:flutter/material.dart';
import 'package:flutter_xb2/app/app_config.dart';
import 'package:flutter_xb2/post/post.dart';

class PostMedia extends StatelessWidget {
  final Post post;
  const PostMedia({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fileId = post.file?.id;
    final imageUrl = '${AppConfig.apiBaseUrl}/files/$fileId/serve?size=medium';

    return Container(
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
