import 'package:flutter_xb2/app/exceptions/app_exception.dart';

class ValidateException extends AppException {
  ValidateException([String message = '未通过数据验证']) : super(message);
}
