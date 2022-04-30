import 'package:flutter_xb2/app/app_service.dart';
import 'package:flutter_xb2/auth/auth_model.dart';
import 'package:provider/provider.dart';

final appServiceProvider = ChangeNotifierProxyProvider<AuthModel, AppService>(
  create: (context) => AppService(authModel: context.read<AuthModel>()),
  update: (context, authModel, appService) => AppService(authModel: authModel),
);

final appProviders = [appServiceProvider];
