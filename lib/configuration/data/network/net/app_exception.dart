class AppException implements Exception {
  final int? code; // HTTP Status
  final String? message;
  final String? errorCode;
  final dynamic detail;

  AppException({required this.code, required this.message, this.errorCode, this.detail});

  @override
  String toString() {
    return "[$code]: $message : $errorCode";
  }
}

class NetworkException extends AppException {
  NetworkException(
      {required super.code, required super.message, super.errorCode});
}

class LocalException extends AppException {
  LocalException(
      {required super.code, required super.message, super.errorCode});
}


class ErrorCode {
  static const int code9999 = 9999;
  static const networkService = 'network_service';
  static const duplicate = 'nong_dan_trung';
  static const fcDuplicate = 'nong_dan_fc_trung';
  static const sessionExpired = 'session_expired';
  static const wrongCurrentPassword = 'wrong_current_password';
  static const requestOtpLimited = 'otp_request_limit_exceeded';
  static const requestOtpExpired = 'otp_request_expired';
  static const invalidRequest = 'invalid_request';
  static const xncgOverLimitConfirm = 'vuot_khung_duyet_gia_xac_nhan_xncg';
}
