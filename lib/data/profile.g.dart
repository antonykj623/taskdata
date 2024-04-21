// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      image: json['image'] as String?,
      name: json['name'] as String?,
      Address: json['Address'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'Address': instance.Address,
      'email': instance.email,
      'phone': instance.phone,
    };
