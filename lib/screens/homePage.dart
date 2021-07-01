import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_app/bloc/cubitApp/cubit.dart';
import 'package:learn_app/bloc/cubitApp/cubit_states.dart';
import 'package:learn_app/bloc/login/blocLogin.dart';
import 'package:learn_app/bloc/register/bloc_register.dart';
import 'package:learn_app/custom_widget/constant_button.dart';

import 'search_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state){},
      builder: (context, state)=>
       Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  navigateTo(context, SearchScreen());
                }),
            // IconButton(
            //   icon: Icon(Icons.brightness_4_outlined),
            //   // onPressed: () {
            //   //   AppCubit.get(context).changeModeApp();
            //   // }
            // ),
          ],
        ),
        body: cubit.bottomScreens[cubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index)
          {
            cubit.changeBottom(index);
          },
          currentIndex: cubit.currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
                label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
