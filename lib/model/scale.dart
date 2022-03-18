import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ministerial_scale_app/utils/strings.dart';

part 'scale.g.dart';

@JsonSerializable()
class Scale {
  int id;
  DateTime date;
  DateTime hour;
  String minister;
  String place;

  Scale(this.id, this.date, this.hour, this.minister, this.place);

  factory Scale.fromJson(Map<String, dynamic> json) => _$ScaleFromJson(json);

  Map<String, dynamic> toJson() => _$ScaleToJson(this);

  @override
  String toString() {
    return 'Scale{id: $id, date: $date, hour: $hour, minister: $minister, place: $place}';
  }
}
