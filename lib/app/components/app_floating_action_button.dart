import 'package:flutter/material.dart';
import 'package:flutter_xb2/app/components/app_bottom_sheet.dart';

/// 分享漂浮按钮
class AppFloatingActionButton extends StatefulWidget {
  const AppFloatingActionButton({Key? key}) : super(key: key);

  @override
  State<AppFloatingActionButton> createState() => _AppFloatingActionButtonState();
}

class _AppFloatingActionButtonState extends State<AppFloatingActionButton> {
  /// 是否正在显示底部面板
  bool isBottomSheetShown = false;

  Icon floatingActionButtonIcon() {
    return isBottomSheetShown ? const Icon(Icons.close) : const Icon(Icons.share_outlined);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // 关闭底部面板
        if (isBottomSheetShown) {
          return Navigator.pop(context);
        }

        // 显示底部面板
        final bottomSheetController = showBottomSheet(
          context: context,
          builder: (context) => const AppBottomSheet(),
        );

        setState(() {
          isBottomSheetShown = true;
        });

        // 关闭底部面板之后的事件
        bottomSheetController.closed.then(
          (value) => {
            setState(() {
              isBottomSheetShown = false;
            })
          },
        );
      },
      child: floatingActionButtonIcon(),
      backgroundColor: Colors.black87,
      foregroundColor: Colors.white70,
    );
  }
}
