import 'package:flutter/material.dart';

/// 底部弹出面板
class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({Key? key}) : super(key: key);

  // 显示对话框
  Future<bool?> showAppAlertDialog(context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确定提交'),
        content: const Text('提交以后无法恢复，确定提交吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('确定'),
          ),
        ],
        // actionsAlignment: MainAxisAlignment.center,
      ),
    );
  }

  /// 显示操作提示栏
  void showAppSnackBar(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('提交成功'),
        action: SnackBarAction(
          label: '关闭',
          onPressed: () {},
        ),
        // 显示时间
        duration: const Duration(seconds: 3),
        // 拖动删除方向，默认是 up
        // dismissDirection: DismissDirection.down,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, -20),
            blurRadius: 30,
          ),
        ],
      ),
      child: Center(
        child: TextButton(
          onPressed: () async {
            // 显示对话框
            final result = await showAppAlertDialog(context);
            print('showAppAlertDialog: $result');

            // 显示操作提示栏
            if (result != null && result) {
              showAppSnackBar(context);
            }
          },
          child: const Text('提交'),
        ),
      ),
    );
  }
}
