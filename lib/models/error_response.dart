class ErrorResponse {
  ErrorResponse({
    this.success,
    this.statusCode,
    this.statusMessage,
  });

  bool? success;
  int? statusCode;
  String? statusMessage;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "status_message": statusMessage,
      };
}
