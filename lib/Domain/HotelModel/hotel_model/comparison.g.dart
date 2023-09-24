// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comparison.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comparison _$ComparisonFromJson(Map<String, dynamic> json) => Comparison(
      hotelName: json['hotelName'] as String?,
      prices: (json['prices'] as List<dynamic>?)
          ?.map((e) => Price.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComparisonToJson(Comparison instance) =>
    <String, dynamic>{
      'hotelName': instance.hotelName,
      'prices': instance.prices,
    };
