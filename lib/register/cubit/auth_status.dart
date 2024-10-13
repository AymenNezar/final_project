abstract class AuthStates{

}

class InitialState extends AuthStates{}
class RegisterLoading extends AuthStates{}
class RegisterSuccess extends AuthStates{}
class RegisterFailed extends AuthStates{
  String message;
  RegisterFailed({required this.message});
}

class LoginLoading extends AuthStates{}
class LoginSuccess extends AuthStates{}
class LoginFailed extends AuthStates{
  final String message;
  LoginFailed({required this.message});
}