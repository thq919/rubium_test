import 'package:json_annotation/json_annotation.dart';
part 'id_model.g.dart';
@JsonSerializable()
class Id {
  String name;
  String? value;
  Id(
    this.name,
    this.value,
  );
  factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);
}