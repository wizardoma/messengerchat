import 'package:firebase_auth/firebase_auth.dart';
import 'package:messengerchat/application/bloc/auth/command/login_command.dart';
import 'package:messengerchat/application/bloc/auth/command/signup_command.dart';
import 'package:messengerchat/application/response_base.dart';
import 'package:messengerchat/application/service/auth_service.dart';

class FirebaseAuthenticationService extends AuthenticationService {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Stream<bool> authenticationStatus() async*{
    bool isSignedIn = false;
    auth.userChanges().listen((user) async* {
      if (user == null) {
        isSignedIn = false;
      }
     else isSignedIn = true;
    });

    yield isSignedIn;
  }

  @override
  Future<Response> login(LoginCommand command) async{
    Response response;
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: command.email,
          password: command.password
      );

      return Response(false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Response.withErrors(isError: true, errors: "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        return Response.withErrors(isError: true, errors: 'Wrong password provided for that user.');
      }
    }
  }

  @override
  Future<Response> signUp(SignUpCommand command) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: command.email,
          password: command.password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Response.withErrors(isError: true,errors: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return Response.withErrors(isError: true, errors: 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

}