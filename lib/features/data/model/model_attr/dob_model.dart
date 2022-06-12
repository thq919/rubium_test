import 'package:json_annotation/json_annotation.dart';
part 'dob_model.g.dart';
@JsonSerializable()
class Dob {
  String date;
  int age;
  Dob(
    this.date,
    this.age,
  );
  factory Dob.fromJson(Map<String, dynamic> json) => _$DobFromJson(json);
}