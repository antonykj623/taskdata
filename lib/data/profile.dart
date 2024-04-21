import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  final String? image;
  final String? name;
  final String? Address;
  final String? email;
  final String? phone;

  const Profile({
    this.image,
    this.name,
    this.Address,
    this.email,
    this.phone,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
