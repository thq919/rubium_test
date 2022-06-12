import 'package:json_annotation/json_annotation.dart';
import 'package:rubium_test/features/data/model/model_attr/coordinated_model.dart';
import 'package:rubium_test/features/data/model/model_attr/street_model.dart';
import 'package:rubium_test/features/data/model/model_attr/timezone_model.dart';

part 'location_model.g.dart';
@JsonSerializable()
class Location {
  Street street;
  String city;
  String state;
  String country;
  dynamic postcode;
  Coordinates coordinates;
  Timezone timezone;
  Location(
    this.street,
    this.city,
    this.state,
    this.country,
    this.postcode,
    this.coordinates,
    this.timezone,
  );
  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}