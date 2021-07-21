abstract class SignUpEvent {}

class SignUpInitiated extends SignUpEvent {}

class ChangeFirstName extends SignUpEvent {
  final String first;

  ChangeFirstName(this.first);
}
class ChangeLastName extends SignUpEvent {
  final String last;

  ChangeLastName(this.last);
}
class ChangeEmail extends SignUpEvent {
  final String email;

  ChangeEmail(this.email);
}

class ChangePassword extends SignUpEvent {
  final String password;

  ChangePassword(this.password);
}

class ChangeConfirmationPassword extends SignUpEvent {
  final String confirmationPassword;

  ChangeConfirmationPassword(this.confirmationPassword);
}

class ResetError extends SignUpEvent {}