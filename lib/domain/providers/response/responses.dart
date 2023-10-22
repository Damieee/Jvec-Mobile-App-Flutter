import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class ApiResponse {
  bool? status;
  bool? success;
  // for banks support
  bool? error;
  String? message;
  dynamic data;
  int? statusCode;

  ApiResponse(this.error,
      {this.status, this.message, this.data, this.statusCode});

  @override
  String toString() {
    return 'ApiResponse(success: $status, error: $error)';
  }

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    //print(json.toString());

    return _$ApiResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
