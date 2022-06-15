class LoginEvent{}


class LoginInitialEvent extends LoginEvent {}

class TryLogin extends LoginEvent {}
class LoginFailed extends LoginEvent {}