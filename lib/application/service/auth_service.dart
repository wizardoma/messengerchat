import 'package:messengerchat/application/bloc/auth/command/login_command.dart';
import 'package:messengerchat/application/bloc/auth/command/signup_command.dart';
import 'package:messengerchat/application/response_base.dart';

abstract class AuthenticationService {
  Future<Response> login(LoginCommand command);
  Future<Response> signUp(SignUpCommand command);
  Stream<bool> authenticationStatus();
}
