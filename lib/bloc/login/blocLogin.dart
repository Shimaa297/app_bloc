import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_app/bloc/login/bloc_LoginStates.dart';
import 'package:learn_app/models/login_model.dart';
import 'package:learn_app/network/end_point.dart';
import 'package:learn_app/sharedPreferences/cacheHelper.dart';
import 'package:learn_app/sharedPreferences/dioHelper.dart';

import '../../constant.dart';


class AppLoginCubit extends Cubit<AppLoginStates>
{
  AppLoginCubit(): super(AppLoginInitialState());

  static AppLoginCubit get(context)=> BlocProvider.of(context);

  LoginModel loginModel;
    void UserLogin({
      @required String email,
      @required String password,
})
    {
      emit(AppLoginLoadingState());
      DioHelper.postData(
          url: LOGIN,
          token: token,
          data:
          {
            'email' : email,
            'password' : password,
          }
      ).then(
              (value)
          {
            loginModel =LoginModel.fromJson(value.data);
            print(loginModel.data.token);
            emit(AppLoginSuccessState(loginModel));
          }
              ).catchError(
              (error)
          {
            emit(AppLoginErrorState(error.toString()));
          });
    }

//   void userLogin({
//     @required String email,
//     @required String password,
// })
//   {
//     emit(AppLoginLoadingState());
//
//     FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email,
//         password: password
//     ).then((value)
//     {
//       print(value.user.email);
//       print(value.user.uid);
//       emit(AppLoginSuccessState());
//
//     }).catchError((error)
//     {
//       print(error.toString());
//       emit(AppLoginErrorState(error.toString()));
//     });
//   }

  // bool isDark = false;
  //
  // void ChangeModeApp({bool fromShared})
  // {
  //   if (fromShared != null)
  //     isDark = fromShared;
  //   else
  //   isDark = ! isDark;
  //   CacheHelper.putData(key: 'isDark', value: isDark).then((value) =>
  //       emit(AppLoginModeState())
  //   );
  // }
}