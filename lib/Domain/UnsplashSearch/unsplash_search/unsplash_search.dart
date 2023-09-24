import 'package:json_annotation/json_annotation.dart';

import 'links.dart';
import 'sponsorship.dart';
import 'urls.dart';
import 'user.dart';

part 'unsplash_search.g.dart';

@JsonSerializable()
class UnsplashSearch {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'promoted_at')
  dynamic promotedAt;

  @JsonKey(name: 'width')
  int? width;

  @JsonKey(name: 'height')
  int? height;

  @JsonKey(name: 'color')
  String? color;
  @JsonKey(name: 'blur_hash')
  String? blurHash;

  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'alt_description')
  String? altDescription;

  @JsonKey(name: 'breadcrumbs')
  List<dynamic>? breadcrumbs;

  @JsonKey(name: 'urls')
  Urls? urls;

  @JsonKey(name: 'links')
  Links? links;

  @JsonKey(name: 'likes')
  int? likes;

  @JsonKey(name: 'liked_by_user')
  bool? likedByUser;
  @JsonKey(name: 'current_user_collections')
  List<dynamic>? currentUserCollections;

  @JsonKey(name: 'sponsorship')
  Sponsorship? sponsorship;


  @JsonKey(name: 'user')
  User? user;

  UnsplashSearch({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    this.breadcrumbs,
    this.urls,
    this.links,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
   
    this.user,
  });

  factory UnsplashSearch.fromJson(Map<String, dynamic> json) {
    return _$UnsplashSearchFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UnsplashSearchToJson(this);
}
