import 'package:flutter/material.dart';

/// 底部导航栏
class AppPageBottom extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppPageBottom({Key? key, required this.onTap, this.currentIndex = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.explore_outlined,
          ),
          activeIcon: Icon(Icons.explore),
          label: '发现',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_a_photo_outlined,
          ),
          activeIcon: Icon(Icons.add_a_photo),
          label: '添加',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle_outlined,
          ),
          activeIcon: Icon(
            Icons.account_circle,
          ),
          label: '用户',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(
        //     Icons.sports_basketball,
        //   ),
        //   label: '练习',
        // ),
      ],
    );
  }
}
