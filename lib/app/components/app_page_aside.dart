import 'package:flutter/material.dart';

class AppPageAside extends StatelessWidget {
  const AppPageAside({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('王皓'),
              accountEmail: Text('test@test.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://picsum.photos/seed/picsum/200/300'),
              ),
            ),
            ListTile(
              title: const Text(
                '作品',
                textAlign: TextAlign.right,
              ),
              trailing: const Icon(
                Icons.image_outlined,
                color: Colors.black26,
                size: 22,
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                '评论',
                textAlign: TextAlign.right,
              ),
              trailing: const Icon(
                Icons.comment_outlined,
                color: Colors.black26,
                size: 22,
              ),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              title: const Text(
                '帐户',
                textAlign: TextAlign.right,
              ),
              trailing: const Icon(
                Icons.manage_accounts_outlined,
                color: Colors.black26,
                size: 22,
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                '管理',
                textAlign: TextAlign.right,
              ),
              trailing: const Icon(
                Icons.collections_outlined,
                color: Colors.black26,
                size: 22,
              ),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              title: const Text(
                '退出',
                textAlign: TextAlign.right,
              ),
              trailing: const Icon(
                Icons.logout_outlined,
                color: Colors.black26,
                size: 22,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
