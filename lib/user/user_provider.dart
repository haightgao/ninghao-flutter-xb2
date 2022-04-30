import 'package:flutter_xb2/user/create/user_create_model.dart';
import 'package:provider/provider.dart';

final userCreateProvider = ChangeNotifierProvider(create: (context) => UserCreateModel());

final userProviders = [
  userCreateProvider,
];
