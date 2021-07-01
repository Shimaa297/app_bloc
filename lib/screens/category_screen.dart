import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_app/bloc/cubitApp/cubit.dart';
import 'package:learn_app/bloc/cubitApp/cubit_states.dart';
import 'package:learn_app/models/homeModel.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppCubitStates>(
      listener: (context , state){},
      builder: (context , state)=> ListView.separated(
        itemBuilder: (context, index) => buildListCategory(AppCubit.get(context).homeModel.data.banners[index].category),
        separatorBuilder: (context, index) => Divider(),
        itemCount: AppCubit.get(context).homeModel.data.banners.length,
      ),
    );
  }
}

Widget buildListCategory(Category model) => Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListTile(
          onTap: () {},
          leading: Image(
            image: NetworkImage(
              model.image
            ),
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
          title: Text(model.name,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                color: Colors.black
              )),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
