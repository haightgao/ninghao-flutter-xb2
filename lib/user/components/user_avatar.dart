import 'package:flutter/material.dart';
import 'package:flutter_xb2/app/app_config.dart';
import 'package:flutter_xb2/post/post.dart';

class UserAvatar extends StatelessWidget {
  final PostUser postUser;
  final double size;

  const UserAvatar({Key? key, required this.postUser, this.size = 32}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userId = postUser.id;
    final avatarUrl = '${AppConfig.apiBaseUrl}/users/$userId/avatar?size=medium';
    return Container(
      width: size,
      height: size,
      child: CircleAvatar(
        backgroundImage: NetworkImage(avatarUrl),
      ),
    );
  }
}
