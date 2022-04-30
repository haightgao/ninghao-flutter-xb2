import 'package:flutter_xb2/app/app_service.dart';
import 'package:flutter_xb2/post/create/post_create_model.dart';
import 'package:flutter_xb2/post/index/post_index_model.dart';
import 'package:flutter_xb2/post/show/post_show_model.dart';
import 'package:provider/provider.dart';

final postShowProvider = ChangeNotifierProvider<PostShowModel>(create: (context) => PostShowModel());

final postIndexProvider = ChangeNotifierProxyProvider<AppService, PostIndexModel>(
  create: (context) => PostIndexModel(appService: context.read<AppService>()),
  update: (context, appService, postIndexModel) => PostIndexModel(
    appService: appService,
    posts: postIndexModel?.posts,
    layout: postIndexModel?.layout,
  ),
);

final postCreateProvider = ChangeNotifierProxyProvider<AppService, PostCreateModel>(
  create: (context) => PostCreateModel(appService: context.read<AppService>()),
  update: (context, appService, postIndexModel) => PostCreateModel(
    appService: appService,
  ),
);

final postProviders = [
  postShowProvider,
  postIndexProvider,
  postCreateProvider,
];
