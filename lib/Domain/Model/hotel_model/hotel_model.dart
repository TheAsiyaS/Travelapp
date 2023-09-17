import 'package:json_annotation/json_annotation.dart';

import 'comparison.dart';

part 'hotel_model.g.dart';

@JsonSerializable()
class HotelModel {
  @JsonKey(name: 'Comparison')
  List<Comparison>? comparison;
  int? totalHotelsCount;
  int? currentPageHotelsCount;
  int? totalpageCount;

  HotelModel({
    this.comparison,
    this.totalHotelsCount,
    this.currentPageHotelsCount,
    this.totalpageCount,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return _$HotelModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HotelModelToJson(this);
}
