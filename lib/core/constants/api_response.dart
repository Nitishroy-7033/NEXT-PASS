class ApiResponse<T> {
  bool? success;
  String? message;
  T? data;

  ApiResponse({this.success, this.message, this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json, Function? fromJson) {
    return ApiResponse<T>(
      success: json["success"],
      message: json["message"],
      data: json["data"] != null && fromJson != null ? fromJson(json["data"]) : null,
    );
  }

  Map<String, dynamic> toJson(Function? toJson) {
    return {
      "success": success,
      "message": message,
      "data": data != null && toJson != null ? toJson(data!) : null,
    };
  }
}
