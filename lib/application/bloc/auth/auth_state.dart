abstract class AuthenticationState {

}

class AuthenticationNotInitialized extends AuthenticationState{}
class NotAuthenticated extends AuthenticationState {}
class IsAuthenticated extends AuthenticationState {}
class Authenticating extends AuthenticationState {}