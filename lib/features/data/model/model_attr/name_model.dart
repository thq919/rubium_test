import 'package:json_annotation/json_annotation.dart';

part 'name_model.g.dart';

@JsonSerializable()
class Name {
  String title;
  String first;
  String last;
  Name(
    this.title,
    this.first,
    this.last,
  );
  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
}
