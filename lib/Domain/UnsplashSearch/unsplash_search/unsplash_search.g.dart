// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unsplash_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnsplashSearch _$UnsplashSearchFromJson(Map<String, dynamic> json) =>
    UnsplashSearch(
      id: json['id'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      promotedAt: json['promoted_at'],
      width: json['width'] as int?,
      height: json['height'] as int?,
      color: json['color'] as String?,
      blurHash: json['blur_hash'] as String?,
      description: json['description'] as String?,
      altDescription: json['alt_description'] as String?,
      breadcrumbs: json['breadcrumbs'] as List<dynamic>?,
      urls: json['urls'] == null
          ? null
          : Urls.fromJson(json['urls'] as Map<String, dynamic>),
      likes: json['likes'] as int?,
      likedByUser: json['liked_by_user'] as bool?,
      currentUserCollections:
          json['current_user_collections'] as List<dynamic>?,
      sponsorship: json['sponsorship'] == null
          ? null
          : Sponsorship.fromJson(json['sponsorship'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UnsplashSearchToJson(UnsplashSearch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'promoted_at': instance.promotedAt,
      'width': instance.width,
      'height': instance.height,
      'color': instance.color,
      'blur_hash': instance.blurHash,
      'description': instance.description,
      'alt_description': instance.altDescription,
      'breadcrumbs': instance.breadcrumbs,
      'urls': instance.urls,
      'likes': instance.likes,
      'liked_by_user': instance.likedByUser,
      'current_user_collections': instance.currentUserCollections,
      'sponsorship': instance.sponsorship,
      'user': instance.user,
    };
