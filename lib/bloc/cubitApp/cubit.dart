
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_app/bloc/cubitApp/cubit_states.dart';
import 'package:learn_app/constant.dart';
import 'package:learn_app/models/change_favorites_model.dart';
import 'package:learn_app/models/favoritesModel.dart';
import 'package:learn_app/models/homeModel.dart';
import 'package:learn_app/network/end_point.dart';
import 'package:learn_app/screens/category_screen.dart';
import 'package:learn_app/screens/favouit_screen.dart';
import 'package:learn_app/screens/products/product_screen.dart';
import 'package:learn_app/screens/setting_screen.dart';
import 'package:learn_app/sharedPreferences/cacheHelper.dart';
import 'package:learn_app/sharedPreferences/dioHelper.dart';


class AppCubit extends Cubit<AppCubitStates>
{
  AppCubit() : super(AppCubitInitialState());

  static AppCubit get(context)=> BlocProvider.of(context);
  
  int currentIndex = 0;

  List <Widget> bottomScreens = [
    ProductScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingScreen(),
  ];

void changeBottom(int index)
{
  currentIndex = index;
  emit(ChangBottomNavigationBar());
}
  HomeModel homeModel;

   Map<int , bool> favorites = {};
void getHomeData()
{
  emit(LoadingHomeData());
  DioHelper.getData(
      url: HOME,
      token: token,
  ).then((value){

      homeModel = HomeModel.fromJson(value.data);
      // print(homeModel.status);
      // print(homeModel.data.banners[0].image);
      homeModel.data.products.forEach((element)
      {
        favorites.addAll(
            {
              element.id : element.inFavorites,
            });
      });
      print(favorites.toString());
   // print(homeModel.data.toString());
    emit(SuccessHomeData());

  }).catchError((error){
    print(error.toString());
    emit(ErrorHomeData());
  });
}

ChangeFavoritesModel changeFavoritesModel;

void changeFavorites(int productId)
{
  // to show now add & delete item favorites 
  favorites[productId] =! favorites[productId];
  emit(ChangeFavoritesHomeData());
  DioHelper.postData(
      url: FAVOR,
      token: token,
      data:
      {
        'product_id' : productId,
        'Authorization' : token,
      },
  ).then((value)
  {
    changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
     print(value.data);
    if(!changeFavoritesModel.status)
    {
      favorites[productId] =! favorites[productId];
    }
    emit(SuccessFavoritesHomeData(changeFavoritesModel));
  }).catchError((error)
  {
    favorites[productId] =! favorites[productId];

    emit(ErrorFavoritesHomeData());
  });
}

FavoritesModel favoritesModel;
void getFavoritesItem()
{
  DioHelper.getData(
    url: FAVOR,
    token: token,
  ).then((value)
      {
        favoritesModel = FavoritesModel.fromJson(value.data);
        print(value.data.toString());
        emit(SuccessFavoritesData());
      } ).catchError((error)
  {
    emit(ErrorFavoritesData(error: error.toString()));
  });

}
  bool isDark = false;

  void changeModeApp({bool fromShared})
  {
    if (fromShared != null)
      isDark = fromShared;
    else
      isDark = ! isDark;
    CacheHelper.putData(key: 'isDark', value: isDark).then((value) =>
        emit(AppModeState())
    );
  }
}