import 'package:json_annotation/json_annotation.dart';

part 'social.g.dart';

@JsonSerializable()
class Social {
  @JsonKey(name: 'instagram_username')
  String? instagramUsername;
  @JsonKey(name: 'portfolio_url')
  String? portfolioUrl;
  @JsonKey(name: 'twitter_username')
  String? twitterUsername;
  @JsonKey(name: 'paypal_email')
  dynamic paypalEmail;

  Social({
    this.instagramUsername,
    this.portfolioUrl,
    this.twitterUsername,
    this.paypalEmail,
  });

  factory Social.fromJson(Map<String, dynamic> json) {
    return _$SocialFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SocialToJson(this);
}
