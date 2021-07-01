abstract class AppRegisterStates {}

class AppInitialState extends AppRegisterStates {}

class AppLoadingState extends AppRegisterStates{}

class AppSuccessState extends AppRegisterStates{}

class AppErrorState extends AppRegisterStates{
  final String error;
  AppErrorState(this.error);
}

class AppCreateUserSuccessState extends AppRegisterStates{}

class AppCreateUserErrorState extends AppRegisterStates{
  final String error;
  AppCreateUserErrorState(this.error);}



 class AppModeState extends AppRegisterStates {}