import 'package:json_annotation/json_annotation.dart';


part 'piaxabay_model.g.dart';

@JsonSerializable()
class PiaxabayModel {
 @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'pageURL')
  String? pageUrl;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'tag')
  String? tags;
  @JsonKey(name: 'previewURL')
  String? previewUrl;
  @JsonKey(name: 'previewWidth')
  int? previewWidth;
  @JsonKey(name: 'previewHeight')
  int? previewHeight;
  @JsonKey(name: 'webformatURL')
  String? webformatUrl;
  @JsonKey(name: 'webformatWidth')
  int? webformatWidth;
  @JsonKey(name: 'webformatHeight')
  int? webformatHeight;
  @JsonKey(name: 'largeImageURL')
  String? largeImageUrl;
  @JsonKey(name: 'imageWidth')
  int? imageWidth;
  @JsonKey(name: 'imageHeight')
  int? imageHeight;
  @JsonKey(name: 'imageSize')
  int? imageSize;
  @JsonKey(name: 'views')
  int? views;
  @JsonKey(name: 'downloads')
  int? downloads;
  @JsonKey(name: 'collections')
  int? collections;
  @JsonKey(name: 'likes')
  int? likes;
  @JsonKey(name: 'comments')
  int? comments;
  @JsonKey(name: 'userId')
  int? userId;
  @JsonKey(name: 'user')
  String? user;
  @JsonKey(name: 'userImageURL')
  String? userImageUrl;
  PiaxabayModel({
    this.id,
    this.pageUrl,
    this.type,
    this.tags,
    this.previewUrl,
    this.previewWidth,
    this.previewHeight,
    this.webformatUrl,
    this.webformatWidth,
    this.webformatHeight,
    this.largeImageUrl,
    this.imageWidth,
    this.imageHeight,
    this.imageSize,
    this.views,
    this.downloads,
    this.collections,
    this.likes,
    this.comments,
    this.userId,
    this.user,
    this.userImageUrl,
  });

  factory PiaxabayModel.fromJson(Map<String, dynamic> json) {
    return _$PiaxabayModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PiaxabayModelToJson(this);
}
