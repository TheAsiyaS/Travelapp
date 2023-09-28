import 'package:json_annotation/json_annotation.dart';

import 'profile_image.dart';
import 'social.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'username')
  String? username;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  dynamic lastName;
  @JsonKey(name: 'twitter_username')
  String? twitterUsername;
  @JsonKey(name: 'portfolio_url')
  String? portfolioUrl;
  @JsonKey(name: 'bio')
  String? bio;
  @JsonKey(name: 'location')
  String? location;

  @JsonKey(name: 'profile_image')
  ProfileImage? profileImage;
  @JsonKey(name: 'instagram_username')
  String? instagramUsername;
  @JsonKey(name: 'total_collections')
  int? totalCollections;
  @JsonKey(name: 'total_likes')
  int? totalLikes;
  @JsonKey(name: 'total_photos')
  int? totalPhotos;
  @JsonKey(name: 'accepted_tos')
  bool? acceptedTos;
  @JsonKey(name: 'for_hire')
  bool? forHire;
  @JsonKey(name: 'social')
  Social? social;

  User({
    this.id,
    this.updatedAt,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.profileImage,
    this.instagramUsername,
    this.totalCollections,
    this.totalLikes,
    this.totalPhotos,
    this.acceptedTos,
    this.forHire,
    this.social,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
