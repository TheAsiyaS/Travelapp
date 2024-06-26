// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'piaxabay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PiaxabayModel _$PiaxabayModelFromJson(Map<String, dynamic> json) =>
    PiaxabayModel(
      id: json['id'] as int?,
      pageUrl: json['pageURL'] as String?,
      type: json['type'] as String?,
      tags: json['tag'] as String?,
      previewUrl: json['previewURL'] as String?,
      previewWidth: json['previewWidth'] as int?,
      previewHeight: json['previewHeight'] as int?,
      webformatUrl: json['webformatURL'] as String?,
      webformatWidth: json['webformatWidth'] as int?,
      webformatHeight: json['webformatHeight'] as int?,
      largeImageUrl: json['largeImageURL'] as String?,
      imageWidth: json['imageWidth'] as int?,
      imageHeight: json['imageHeight'] as int?,
      imageSize: json['imageSize'] as int?,
      views: json['views'] as int?,
      downloads: json['downloads'] as int?,
      collections: json['collections'] as int?,
      likes: json['likes'] as int?,
      comments: json['comments'] as int?,
      userId: json['userId'] as int?,
      user: json['user'] as String?,
      userImageUrl: json['userImageURL'] as String?,
    );

Map<String, dynamic> _$PiaxabayModelToJson(PiaxabayModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pageURL': instance.pageUrl,
      'type': instance.type,
      'tag': instance.tags,
      'previewURL': instance.previewUrl,
      'previewWidth': instance.previewWidth,
      'previewHeight': instance.previewHeight,
      'webformatURL': instance.webformatUrl,
      'webformatWidth': instance.webformatWidth,
      'webformatHeight': instance.webformatHeight,
      'largeImageURL': instance.largeImageUrl,
      'imageWidth': instance.imageWidth,
      'imageHeight': instance.imageHeight,
      'imageSize': instance.imageSize,
      'views': instance.views,
      'downloads': instance.downloads,
      'collections': instance.collections,
      'likes': instance.likes,
      'comments': instance.comments,
      'userId': instance.userId,
      'user': instance.user,
      'userImageURL': instance.userImageUrl,
    };
