import 'package:json_annotation/json_annotation.dart';

part 'price.g.dart';

@JsonSerializable()
class Price {
    @JsonKey(name: 'price')
  int? price;
    @JsonKey(name: 'tax')
  int? tax;
    @JsonKey(name: 'vendor')
  String? vendor;

  Price({this.price, this.tax, this.vendor});

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
