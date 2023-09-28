// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'piaxabay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PiaxabayModel _$PiaxabayModelFromJson(Map<String, dynamic> json) =>
    PiaxabayModel(
      total: json['total'] as int?,
      totalHits: json['totalHits'] as int?,
      hits: (json['hits'] as List<dynamic>?)
          ?.map((e) => Hit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PiaxabayModelToJson(PiaxabayModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'totalHits': instance.totalHits,
      'hits': instance.hits,
    };
