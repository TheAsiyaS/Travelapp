import 'package:json_annotation/json_annotation.dart';

import 'sponsor.dart';

part 'sponsorship.g.dart';

@JsonSerializable()
class Sponsorship {
  @JsonKey(name: 'impression_urls')
  List<String>? impressionUrls;
  @JsonKey(name: 'tagline')
  String? tagline;
  @JsonKey(name: 'tagline_url')
  String? taglineUrl;
  @JsonKey(name: 'sponsor')
  Sponsor? sponsor;

  Sponsorship({
    this.impressionUrls,
    this.tagline,
    this.taglineUrl,
    this.sponsor,
  });

  factory Sponsorship.fromJson(Map<String, dynamic> json) {
    return _$SponsorshipFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SponsorshipToJson(this);
}
