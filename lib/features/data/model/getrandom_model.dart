import 'package:json_annotation/json_annotation.dart';
import 'package:rubium_test/features/data/model/model_attr/identity_model.dart';
import 'package:rubium_test/features/data/model/model_attr/info_model.dart';

part 'getrandom_model.g.dart';

@JsonSerializable()
class GetRandomUserModel {
  List<Identity> results;
  Info info;

  GetRandomUserModel(this.results, this.info);

  factory GetRandomUserModel.fromJson(Map<String, dynamic> json) =>
      _$GetRandomUserModelFromJson(json);
}

