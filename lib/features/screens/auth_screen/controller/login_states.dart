class LoginState {}

class InitialLoginState extends LoginState {}

class Logined extends LoginState {
  String login;
  Logined(this.login);
}

class NotLogined extends LoginState {}
