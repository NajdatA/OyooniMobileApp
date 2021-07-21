abstract class LoginEvent {}
class LoginInitiated extends LoginEvent {}
class CheckTokenEvent extends LoginEvent {}
class ChangeEmail extends LoginEvent {
  final String email;

  ChangeEmail(this.email);
}
class ChangePassword extends LoginEvent {
  final String password;

  ChangePassword(this.password);
}
class ResetError extends LoginEvent {}