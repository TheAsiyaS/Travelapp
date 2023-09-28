import 'package:json_annotation/json_annotation.dart';

part 'urls.g.dart';

@JsonSerializable()
class Urls {
  @JsonKey(name: 'regular')
  String? regular;

  Urls({
    this.regular,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);

  Map<String, dynamic> toJson() => _$UrlsToJson(this);
}
