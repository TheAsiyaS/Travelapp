import 'package:json_annotation/json_annotation.dart';

import 'hit.dart';

part 'piaxabay_model.g.dart';

@JsonSerializable()
class PiaxabayModel {
  @JsonKey(name: 'total')
  int? total;
  @JsonKey(name: 'totalHits')
  int? totalHits;
  @JsonKey(name: 'hits')
  List<Hit>? hits;

  PiaxabayModel({this.total, this.totalHits, this.hits});

  factory PiaxabayModel.fromJson(Map<String, dynamic> json) {
    return _$PiaxabayModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PiaxabayModelToJson(this);
}
