// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      price: json['price'] as int?,
      tax: json['tax'] as int?,
      vendor: json['vendor'] as String?,
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'price': instance.price,
      'tax': instance.tax,
      'vendor': instance.vendor,
    };
