// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => ApiResponse(
  statusCode: (json['status_code'] as num).toInt(),
  message: json['message'] as String,
  userDetails: json['user_details'] == null
      ? null
      : UserDetails.fromJson(json['user_details'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'message': instance.message,
      'user_details': instance.userDetails,
    };
