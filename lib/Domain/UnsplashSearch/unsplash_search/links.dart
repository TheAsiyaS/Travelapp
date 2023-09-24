import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@JsonSerializable()
class Links {
  @JsonKey(name: 'download')
  String? download;
  @JsonKey(name: 'download_location')
  String? downloadLocation;

  Links({this.download, this.downloadLocation});

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
