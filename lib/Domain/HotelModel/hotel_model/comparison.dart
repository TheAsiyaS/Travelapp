import 'package:json_annotation/json_annotation.dart';

import 'price.dart';

part 'comparison.g.dart';

@JsonSerializable()
class Comparison {
  @JsonKey(name: 'hotelName')
  String? hotelName;
  @JsonKey(name: 'prices')
  List<Price>? prices;

  Comparison({this.hotelName, this.prices});

  factory Comparison.fromJson(Map<String, dynamic> json) {
    return _$ComparisonFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ComparisonToJson(this);
}
