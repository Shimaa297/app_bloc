import 'package:learn_app/models/login_model.dart';

abstract class AppLoginStates {}

class AppLoginInitialState extends AppLoginStates {}

class AppLoginLoadingState extends AppLoginStates{}

class AppLoginSuccessState extends AppLoginStates
{
  final LoginModel loginModel;

  AppLoginSuccessState(this.loginModel);
}


class AppLoginErrorState extends AppLoginStates{
  final String error;
  AppLoginErrorState(this.error);
}


class AppLoginModeState extends AppLoginStates {}


