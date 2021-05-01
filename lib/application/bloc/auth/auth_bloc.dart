import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:messengerchat/application/bloc/auth/auth_event.dart';
import 'package:messengerchat/application/bloc/auth/auth_state.dart';
import 'package:messengerchat/application/service/auth_service.dart';

import '../../command_base.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationService _authenticationService;
  StreamSubscription _streamSubscription;

  AuthenticationBloc(this._authenticationService) : super(AuthenticationNotInitialized()){
    _streamSubscription = _authenticationService.authenticationStatus()
        .listen((isLogged) {
          if (!isLogged) {
            this.emit(NotAuthenticated());
          }
    });
  }


  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async*{
    if (event is LoginEvent){
      yield Authenticating();
      yield await Future.delayed(Duration(seconds: 1), ()=> login(event.loginCommand));
    }


    if (event is SignUpEvent) {
      yield Authenticating();
      yield await Future.delayed(Duration(seconds: 1), () => signup(event.signupCommand));
    }

  }

  Future<AuthenticationState> signup(Command command) async{
    var response =await _authenticationService.signUp(command);
    if (response.isError) return AuthenticationError(response.errors);
    return IsAuthenticated();
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }

  Future<AuthenticationState> login(Command command)async {
    var response = await _authenticationService.login(command);
    if (response.isError){
      return AuthenticationError(response.errors);
    }

    return IsAuthenticated();
  }

}