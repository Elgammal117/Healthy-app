// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
  email: json['email'] as String?,
  password: json['password'] as String?,
);

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

LoginRespons _$LoginResponsFromJson(Map<String, dynamic> json) => LoginRespons(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  token: json['token'] as String?,
  user: json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LoginResponsToJson(LoginRespons instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'token': instance.token,
      'user': instance.user?.toJson(),
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String?,
  email: json['email'] as String?,
  userName: json['userName'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'userName': instance.userName,
};

SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) =>
    SignUpRequest(
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$SignUpRequestToJson(SignUpRequest instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
    };

SignUpRespons _$SignUpResponsFromJson(Map<String, dynamic> json) =>
    SignUpRespons(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      userId: json['userId'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$SignUpResponsToJson(SignUpRespons instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'userId': instance.userId,
      'email': instance.email,
    };

OtpRequest _$OtpRequestFromJson(Map<String, dynamic> json) =>
    OtpRequest(email: json['email'] as String?, otp: json['otp'] as String?);

Map<String, dynamic> _$OtpRequestToJson(OtpRequest instance) =>
    <String, dynamic>{'email': instance.email, 'otp': instance.otp};

OtpRespons _$OtpResponsFromJson(Map<String, dynamic> json) => OtpRespons(
  success: json['success'] as bool?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$OtpResponsToJson(OtpRespons instance) =>
    <String, dynamic>{'success': instance.success, 'message': instance.message};
