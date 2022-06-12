import 'package:rubium_test/features/data/model/getrandom_model.dart';
import 'package:rubium_test/features/data/model/model_attr/identity_model.dart';

abstract class ScreensState {}

class InitialState extends ScreensState {}

class LoginNeedState extends ScreensState {}

class LoadingState extends ScreensState {}

class LoadedState extends ScreensState {
  GetRandomUserModel model;
  String login;
  LoadedState(this.model, this.login);
}

class DescribeItemState extends ScreensState {
  Identity entity;
  DescribeItemState(this.entity);
}
