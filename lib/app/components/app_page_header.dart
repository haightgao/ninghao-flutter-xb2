import 'package:flutter/material.dart';
import 'package:flutter_xb2/app/components/app_logo.dart';

/// 头部AppBar

class AppPageHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const AppLogo(),
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
        ),
      ],
      bottom: const TabBar(
        tabs: [
          Tab(
            child: Text('最近'),
          ),
          Tab(
            child: Text('热门'),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}
