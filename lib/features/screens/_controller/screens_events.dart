import 'package:rubium_test/features/data/model/model_attr/identity_model.dart';

abstract class ScreensEvent {}

class InitialEvent extends ScreensEvent {}

class LoadEvent extends ScreensEvent {}

class LoginNeedEvent extends ScreensEvent {}

class LoginCompleteEvent extends ScreensEvent {
  String login;
  LoginCompleteEvent(this.login);
}

class ReloadEvent extends ScreensEvent {}

class RenewScreenEvent extends ScreensEvent {}

class ItemNeedToShowDescribeEvent extends ScreensEvent {
  Identity entity;
  ItemNeedToShowDescribeEvent(this.entity);
}

class SortEvent extends ScreensEvent {
  String sortQuery;
  SortEvent(this.sortQuery);
}

class DropLoginEvent extends ScreensEvent {}
