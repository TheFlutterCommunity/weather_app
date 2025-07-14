// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
  userId: (json['user_id'] as num).toInt(),
  userName: json['user_name'] as String,
  emailId: json['email_id'] as String,
  token: json['token'] as String,
  mobileNo: json['mobile_no'] as String,
);

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user_name': instance.userName,
      'email_id': instance.emailId,
      'token': instance.token,
      'mobile_no': instance.mobileNo,
    };
