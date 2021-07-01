import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_app/bloc/register/bloc_registerStates.dart';
import 'package:learn_app/models/user_model.dart';
import 'package:learn_app/network/end_point.dart';
import 'package:learn_app/sharedPreferences/cacheHelper.dart';
import 'package:learn_app/sharedPreferences/dioHelper.dart';

class AppRegisterCubit extends Cubit<AppRegisterStates> {
  AppRegisterCubit() : super(AppInitialState());

  static AppRegisterCubit get(context) => BlocProvider.of(context);

//   void userRegister({
//     @required String name,
//     @required String email,
//     @required String password,
//     @required String phone,
//   }) {
//     print('hello');
//     emit(AppLoadingState());
//
//     print('User');
//     FirebaseAuth.instance
//         .createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//     ).then((value)
//     {
//       // print(value.user.email);
//       // print(value.user.uid);
//       userCreate(
//           uId: value.user.uid,
//           name: name,
//           email: email,
//           phone: phone
//       );
//     }).catchError((error)
//     {
//       print(error.toString());
//       emit(AppErrorState(error.toString()));
//     });
//   }
//
//   void userCreate({
//     @required String uId,
//     @required String name,
//     @required String email,
//     @required String phone,
// }){
//
//     UserModel model = UserModel(
//       name: name,
//       uId: uId,
//       email: email,
//       phone: phone,
//     );
//     FirebaseFirestore.instance.
//     collection('users')
//         .doc(uId)
//         .set(model.toMap()).then((value)
//     {
//       emit(AppCreateUserSuccessState());
//     }).catchError((error)
//     {
//       emit(AppCreateUserErrorState(error.toString()));
//     });
//   }

 void UserRegister({
    @required String name,
    @required String email,
   @required String password,
    @required String phone,
})
 {

   emit(AppLoadingState());
   DioHelper.postData(
       url: REGISTER,
       data:
       {
         'name' : name,
         'email' : email,
         'password' : password,
         'phone' : phone,
       }
   ).then(
           (value)
       {
         print(value.data);
         emit(AppSuccessState());
       }
           ).catchError((error)
   {
     emit(AppErrorState(error.toString()));
   });
 }
  // bool isDark = false;
  //
  // void changeModeApp({bool fromShared})
  // {
  //   if (fromShared != null)
  //     isDark = fromShared;
  //   else
  //   isDark = ! isDark;
  //   CacheHelper.putData(key: 'isDark', value: isDark).then((value) =>
  //       emit(AppModeState())
  //   );
  // }
}
