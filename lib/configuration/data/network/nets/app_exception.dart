class AppException implements Exception {
  final int? code; // HTTP Status
  final String? message;
  final String? errorCode;
  final dynamic detail;

  AppException({
    required this.code,
    required this.message,
    this.errorCode,
    this.detail,
  });

  @override
  String toString() {
    return "[$code]: $message : $errorCode";
  }
}

class NetworkException extends AppException {
  NetworkException({required super.code, required super.message, super.errorCode});
}

class LocalException extends AppException {
  LocalException({required super.code, required super.message, super.errorCode});
}
