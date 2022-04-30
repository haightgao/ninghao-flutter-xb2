import 'package:flutter/material.dart';
import 'package:flutter_xb2/app/app_model.dart';
import 'package:provider/provider.dart';

class PlaygroundRouting extends StatelessWidget {
  const PlaygroundRouting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context);

    return Container(
      color: Colors.white,
      child: Center(
        child: TextButton(
          child: const Text('查看内容'),
          onPressed: () {
            // Navigator.pushNamed(context, '/posts/3', arguments: {'user': 'wanghao'});
            appModel.setPageName('AppAbout');
          },
        ),
      ),
    );
  }
}
