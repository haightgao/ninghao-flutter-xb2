import 'package:flutter/material.dart';
import 'package:flutter_xb2/app/components/app_logo.dart';
import 'package:flutter_xb2/app/components/app_page_header_actions_more.dart';

/// 头部AppBar
class AppPageHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const AppLogo(),
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(Icons.menu),
      ),
      actions: const [
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.more_horiz),
        // ),
        AppPageHeaderActionsMore(),
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
