import 'package:flutter/material.dart';
import 'package:flutter_xb2/app/components/app_floating_action_button.dart';
import 'package:flutter_xb2/app/components/app_page_bottom.dart';
import 'package:flutter_xb2/app/components/app_page_header.dart';
import 'package:flutter_xb2/app/components/app_page_main.dart';
import 'package:flutter_xb2/app/themes/app_theme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int currentAppBottomNavigationBarItem = 0;
  bool showAppBar = true;

  void onTapAppBottomNavigationBarItem(int index) {
    setState(() {
      currentAppBottomNavigationBarItem = index;
      showAppBar = index == 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.amber,
          appBar: showAppBar ? const AppPageHeader() : null,
          body: AppPageMain(currentIndex: currentAppBottomNavigationBarItem),
          bottomNavigationBar: AppPageBottom(
            currentIndex: currentAppBottomNavigationBarItem,
            onTap: onTapAppBottomNavigationBarItem,
          ),
          floatingActionButton: const AppFloatingActionButton(),
        ),
      ),
    );
  }
}
