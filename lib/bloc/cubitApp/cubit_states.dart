import 'package:learn_app/models/change_favorites_model.dart';

abstract class AppCubitStates {}

class AppCubitInitialState extends AppCubitStates {}

class AppModeState extends AppCubitStates {}

class ChangBottomNavigationBar extends AppCubitStates{}

class LoadingHomeData extends AppCubitStates{}

class SuccessHomeData extends AppCubitStates{}

class ErrorHomeData extends AppCubitStates
{
  var error;
  ErrorHomeData({this.error});
}
 class ChangeFavoritesHomeData extends AppCubitStates{}

class SuccessFavoritesHomeData extends AppCubitStates
{
  final ChangeFavoritesModel model;

  SuccessFavoritesHomeData(this.model);
}

class ErrorFavoritesHomeData extends AppCubitStates
{
  var error;
  ErrorFavoritesHomeData({this.error});
}

class SuccessFavoritesData extends AppCubitStates {}

class ErrorFavoritesData extends AppCubitStates
{
  var error;
  ErrorFavoritesData({this.error});
}