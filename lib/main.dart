import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_app/bloc/cubitApp/cubit.dart';
import 'package:learn_app/bloc/cubitApp/cubit_states.dart';
import 'package:learn_app/bloc/register/bloc_register.dart';
import 'package:learn_app/constant.dart';
import 'package:learn_app/pages/on_boarding/onBoarding_screen.dart';
import 'package:learn_app/screens/homePage.dart';
import 'package:learn_app/screens/login_screen.dart';
import 'package:learn_app/sharedPreferences/cacheHelper.dart';
import 'package:learn_app/sharedPreferences/dioHelper.dart';
import 'bloc/login/blocLogin.dart';
import 'bloc/bloc_observer.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  DioHelper.init();

  bool isDark = CacheHelper.getData(key: 'isDark');

  Widget widget;

  bool onBoarding = CacheHelper.getData(key: 'onBoarding');

  print(onBoarding);

  String token = CacheHelper.getData(key: 'token');

  print(token);

  if(onBoarding != null)
  {
    if(token != null) widget = HomePage();
    else widget = LoginScreen();
  } else
    {
      widget = OnBoardScreen();
    }
  runApp(MyApp(
     isDark: isDark,
     startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  final bool isDark;
  final Widget startWidget;
  MyApp({this.isDark, this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (BuildContext context)=> AppRegisterCubit(),),
        BlocProvider(
            create: (BuildContext context)=> AppLoginCubit()),
        BlocProvider(create: (BuildContext context)=> AppCubit()..getHomeData()..getFavoritesItem()
          // ..changeModeApp(fromShared: isDark)
        ),
      ],
        child: BlocConsumer<AppCubit, AppCubitStates>(
            listener: (context , state){},
            builder: (context , state)
            {
              return  MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: themeDataLight,
                 themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
                darkTheme:  themeDataDark,
                home: startWidget,
              );
            }
        )
    );
  }
}

