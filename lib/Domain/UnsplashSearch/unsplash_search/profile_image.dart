import 'package:json_annotation/json_annotation.dart';

part 'profile_image.g.dart';

@JsonSerializable()
class ProfileImage {
  @JsonKey(name: 'small')
  String? small;
  @JsonKey(name: 'medium')
  String? medium;
  @JsonKey(name: 'large')
  String? large;

  ProfileImage({this.small, this.medium, this.large});

  factory ProfileImage.fromJson(Map<String, dynamic> json) {
    return _$ProfileImageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileImageToJson(this);
}
