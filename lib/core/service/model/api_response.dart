import 'package:json_annotation/json_annotation.dart';

import '../../../index.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse {
  @JsonKey(name: 'status_code')
  final int statusCode;
  final String message;
  @JsonKey(name: 'user_details')
  final UserDetails? userDetails;

  ApiResponse({
    required this.statusCode,
    required this.message,
    required this.userDetails,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
