import 'package:flutter_xb2/app/exceptions/app_exception.dart';

class HttpException extends AppException {
  HttpException([String message = '网络请求出现问题']) : super(message);
}
