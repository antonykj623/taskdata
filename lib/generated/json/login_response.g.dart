import 'package:tasknew/generated/json/base/json_convert_content.dart';
import 'package:tasknew/models/login_response.dart';
import 'package:json_annotation/json_annotation.dart';


LoginResponse $LoginResponseFromJson(Map<String, dynamic> json) {
  final LoginResponse loginResponse = LoginResponse();
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    loginResponse.token = token;
  }
  return loginResponse;
}

Map<String, dynamic> $LoginResponseToJson(LoginResponse entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['token'] = entity.token;
  return data;
}

extension LoginResponseExtension on LoginResponse {
  LoginResponse copyWith({
    String? token,
  }) {
    return LoginResponse()
      ..token = token ?? this.token;
  }
}