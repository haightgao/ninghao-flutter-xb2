import 'package:flutter/material.dart';
import 'package:flutter_xb2/post/create/post_create_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_xb2/app/components/app_page_aside.dart';
import 'package:flutter_xb2/app/components/app_page_bottom.dart';
import 'package:flutter_xb2/app/components/app_page_header.dart';
import 'package:flutter_xb2/app/components/app_page_main.dart';

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int currentAppBottomNavigationBarItem = 0;
  bool showAppBar = true;

  void onTapAppBottomNavigationBarItem(int index) async {
    final postCreateModel = context.read<PostCreateModel>();
    final retainDataAlertDialog = AlertDialog(
      title: Text('是否保留未发布的内容'),
      actions: [
        TextButton(
          child: const Text('否'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: const Text('是'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );

    if (currentAppBottomNavigationBarItem == 1 && postCreateModel.hasData()) {
      final retainDataResult = await showDialog(
        context: context,
        builder: (context) => retainDataAlertDialog,
      );

      if (retainDataResult == null) {
        return;
      }

      if (!retainDataResult) {
        postCreateModel.reset();
      }
    }
    setState(() {
      currentAppBottomNavigationBarItem = index;
      showAppBar = index == 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // backgroundColor: Colors.amber,
        appBar: showAppBar ? const AppPageHeader() : null,
        body: AppPageMain(currentIndex: currentAppBottomNavigationBarItem),
        bottomNavigationBar: AppPageBottom(
          currentIndex: currentAppBottomNavigationBarItem,
          onTap: onTapAppBottomNavigationBarItem,
        ),
        // floatingActionButton: const AppFloatingActionButton(),
        drawer: const AppPageAside(),
      ),
    );
  }
}
