import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_app/bloc/search/states.dart';
import 'package:learn_app/models/searchModel.dart';
import 'package:learn_app/network/end_point.dart';
import 'package:learn_app/sharedPreferences/dioHelper.dart';

class SearchAppCubit extends Cubit<SearchStates>
{
  SearchAppCubit() : super(InitialSearchState());

  static SearchAppCubit get(context)=> BlocProvider.of(context);

  SearchModel searchModel;

  void search(String text)
  {
    DioHelper.postData(
        url: SEARCH,
        data:
        {
          'text' : text,
        }
    ).then((value)
    {
      emit(SuccessSearchState());
    }).catchError((error)
    {
      emit(ErrorSearchState(error: error.toString()));
    });
  }
}