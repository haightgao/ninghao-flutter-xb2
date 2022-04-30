class AppException implements Exception {
  late String message;

  AppException(String? message) {
    this.message = message ?? '网络请求出现问题';
  }

  @override
  String toString() {
    return '$runtimeType: $message';
  }
}
