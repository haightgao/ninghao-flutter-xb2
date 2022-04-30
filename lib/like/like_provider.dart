import 'package:flutter_xb2/app/app_service.dart';
import 'package:flutter_xb2/like/create/like_create_model.dart';
import 'package:flutter_xb2/like/destroy/like_destroy_model.dart';
import 'package:provider/provider.dart';

final likeCreateProvider = ChangeNotifierProxyProvider<AppService, LikeCreateModel>(
  create: (context) => LikeCreateModel(appService: context.read<AppService>()),
  update: (context, appService, likeCreateModel) => LikeCreateModel(appService: appService),
);

final likeDestroyProvider = ChangeNotifierProxyProvider<AppService, LikeDestroyModel>(
  create: (context) => LikeDestroyModel(appService: context.read<AppService>()),
  update: (context, appService, likeCreateModel) => LikeDestroyModel(appService: appService),
);

final likeProviders = [
  likeCreateProvider,
  likeDestroyProvider,
];
