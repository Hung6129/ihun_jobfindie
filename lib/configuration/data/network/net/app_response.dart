class Metadata {
  final bool status;
  final String? errorCode;
  final String? message;

  Metadata({
    this.status = false,
    this.errorCode,
    this.message,
  });

  factory Metadata.fromJson(Map<String, dynamic>? json) => Metadata(
        status: json?["status"] ?? false,
        errorCode: json?["errorCode"] ?? '',
        message: json?["message"] ?? '',
      );

  static Metadata fromResponseJson(Map<String, dynamic>? json) {
    return Metadata(
      status: json?['meta']["status"] ?? false,
      errorCode: json?['meta']["errorCode"] ?? '',
      message: json?['meta']["message"] ?? '',
    );
  }

  static Metadata get defaultSystemErrorMeta {
    return Metadata(
        status: false,
        errorCode: "500",
        message: "Có lỗi khi lấy dữ liệu, vui lòng thử lại");
  }
}

class AppResponse {
  final Metadata? meta;
  final dynamic data;
  final int page;
  final int limit;
  final bool hasMore;
  final int total;

  AppResponse(
      {this.meta,
      this.data,
      this.page = 1,
      this.total = 0,
      this.hasMore = false,
      this.limit = 20});

  factory AppResponse.fromJson(Map<String, dynamic>? json) {
    return AppResponse(
        meta: Metadata.fromJson(json?['meta']), data: json?['data']);
  }

  static AppResponse fromJsonToList(Map<String, dynamic>? json) {
    return AppResponse(
        meta: Metadata.fromJson(json?['meta']),
        data: json?['data']['items'] ?? List.empty(),
        page: json?['data']['page'] ?? 0,
        limit: json?['data']['limit'] ?? 20,
        hasMore: json?['data']['hasMore'] ?? false,
        total: json?['data']['total'] ?? 0);
  }
}
