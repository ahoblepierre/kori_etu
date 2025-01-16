class ErrorResponse {
  ErrorResponse({
    required this.statusCode,
    required this.timestamp,
    required this.message,
    required this.source,
  });

  final String? statusCode;
  final DateTime? timestamp;
  final String? message;
  final String? source;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      statusCode: json["statusCode"],
      timestamp: json["timestamp"] == null
          ? null
          : DateTime.tryParse(json["timestamp"] ?? ""),
      message: json["message"],
      source: json["source"],
    );
  }

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "timestamp": timestamp?.toIso8601String(),
        "message": message,
        "source": source,
      };

  @override
  String toString() {
    return "$statusCode, $timestamp, $message, $source, ";
  }
}
