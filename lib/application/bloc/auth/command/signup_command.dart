import 'package:messengerchat/application/command_base.dart';

class SignUpCommand extends Command {
  final String email;
  final String password;

  SignUpCommand(this.email, this.password);
}