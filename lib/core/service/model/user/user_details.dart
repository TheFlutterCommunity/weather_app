import 'package:json_annotation/json_annotation.dart';

part 'user_details.g.dart';

@JsonSerializable()
class UserDetails {
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'user_name')
  final String userName;
  @JsonKey(name: 'email_id')
  final String emailId;
  final String token;
  @JsonKey(name: 'mobile_no')
  final String mobileNo;

  UserDetails({
    required this.userId,
    required this.userName,
    required this.emailId,
    required this.token,
    required this.mobileNo,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}
