
import 'package:json_annotation/json_annotation.dart';

part 'street_model.g.dart';
@JsonSerializable()
class Street {
  int number;
  String name;
  Street(
    this.number,
    this.name,
  );
  factory Street.fromJson(Map<String, dynamic> json) => _$StreetFromJson(json);
}
