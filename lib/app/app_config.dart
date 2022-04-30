import 'package:flutter_dotenv/flutter_dotenv.dart';

/// App 配置
class AppConfig {
  /// API 基地址
  static String get apiBaseUrl => dotenv.get('API_BASE_URL', fallback: 'https://nid-node.ninghao.co');
}
