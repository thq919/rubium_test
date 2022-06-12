import 'package:json_annotation/json_annotation.dart';
import 'package:rubium_test/features/data/model/model_attr/dob_model.dart';
import 'package:rubium_test/features/data/model/model_attr/id_model.dart';
import 'package:rubium_test/features/data/model/model_attr/location_model.dart';
import 'package:rubium_test/features/data/model/model_attr/login_model.dart';
import 'package:rubium_test/features/data/model/model_attr/name_model.dart';
import 'package:rubium_test/features/data/model/model_attr/picture_model.dart';
import 'package:rubium_test/features/data/model/model_attr/registered_model.dart';

part 'identity_model.g.dart';

@JsonSerializable()
class Identity {
  String gender;
  Name name;
  Location location;
  String email;
  Login login;
  Dob dob;
  Registered registered;
  String phone;
  String cell;
  Id id;
  Picture picture;
  String nat;
  Identity(
    this.picture,
    this.gender,
    this.name,
    this.location,
    this.email,
    this.login,
    this.dob,
    this.registered,
    this.phone,
    this.cell,
    this.id,
    this.nat,
  );
  factory Identity.fromJson(Map<String, dynamic> json) =>
      _$IdentityFromJson(json);
}

