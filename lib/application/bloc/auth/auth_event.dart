import '../../command_base.dart';

abstract class AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {
  final Command loginCommand;

  LoginEvent(this.loginCommand);
}
class SignUpEvent extends AuthenticationEvent {
  final Command signupCommand;

  SignUpEvent(this.signupCommand);
}