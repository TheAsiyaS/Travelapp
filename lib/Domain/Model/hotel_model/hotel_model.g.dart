// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelModel _$HotelModelFromJson(Map<String, dynamic> json) => HotelModel(
      comparison: (json['Comparison'] as List<dynamic>?)
          ?.map((e) => Comparison.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalHotelsCount: json['totalHotelsCount'] as int?,
      currentPageHotelsCount: json['currentPageHotelsCount'] as int?,
      totalpageCount: json['totalpageCount'] as int?,
    );

Map<String, dynamic> _$HotelModelToJson(HotelModel instance) =>
    <String, dynamic>{
      'Comparison': instance.comparison,
      'totalHotelsCount': instance.totalHotelsCount,
      'currentPageHotelsCount': instance.currentPageHotelsCount,
      'totalpageCount': instance.totalpageCount,
    };
