import 'package:messengerchat/application/command_base.dart';

class LoginCommand extends Command{
  final String email;
  final  String password;

  LoginCommand(this.email, this.password);


}