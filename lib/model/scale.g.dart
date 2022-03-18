// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scale.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Scale _$ScaleFromJson(Map<String, dynamic> json) => Scale(
      json['id'],
      DateFormat(Strings.dateFormatBrazilian).parse(json['date']),
      DateFormat(Strings.hourFormatBrazilian).parse(json['hour']),
      json['minister'],
      json['place'],
    );

Map<String, dynamic> _$ScaleToJson(Scale instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'hour': instance.hour.toIso8601String(),
      'minister': instance.minister,
      'place': instance.place,
    };
