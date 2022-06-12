import 'package:json_annotation/json_annotation.dart';

part 'coordinated_model.g.dart';

@JsonSerializable()
class Coordinates {
  String latitude;
  String longitude;
  Coordinates(
    this.latitude,
    this.longitude,
  );
  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);
}