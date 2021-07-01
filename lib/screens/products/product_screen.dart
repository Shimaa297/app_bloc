import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_app/bloc/cubitApp/cubit.dart';
import 'package:learn_app/bloc/cubitApp/cubit_states.dart';
import 'package:learn_app/constant.dart';
import 'package:learn_app/custom_widget/flutter_toast.dart';
import 'package:learn_app/models/homeModel.dart';
import 'package:learn_app/sharedPreferences/dioHelper.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state)
      {
        if(state is SuccessFavoritesHomeData)
        {
          if(!state.model.status)
          {
            showToast(
                text: state.model.message,
                state: ToastState.ERROR
            );
          }
        }
      },
      builder: (context, state) => ConditionalBuilder(
        condition: AppCubit.get(context).homeModel !=null,
          builder: (context)=>productBuilder(AppCubit.get(context).homeModel , context),
        fallback: (context)=> Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

Widget productBuilder(HomeModel model, context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            // convert list to map
              items: model.data.banners.map((e) =>
                Image(
                  image: NetworkImage(e.image),
                   fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ).toList(),

              options: CarouselOptions(
                height: 250.0,
                initialPage: 0,
                viewportFraction: 1.0,
                autoPlay: true,
                reverse: false,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(seconds: 1),
                scrollDirection: Axis.horizontal,
                enableInfiniteScroll: true,
                autoPlayCurve: Curves.fastOutSlowIn,
              )),
          SizedBox(height: 10.0,),
          Text(
            'Category',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 10.0,),
          Container(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context , index)=> buildCategoryItem(model.data.banners[index].category ),
                separatorBuilder: (context , index)=> SizedBox(width: 20.0,),
                itemCount: model.data.banners.length,
            ),
          ),
          SizedBox(height: 15.0,),
          Text(
            'New Product',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 10.0,),
          Container(
            color: Colors.grey[200],
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              childAspectRatio: 1 / 1.59,
              children: List.generate(
                  model.data.products.length,
                      (index) => buildGridProduct(model.data.products[index] , context)
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildGridProduct(Product model , context)=> Directionality(
  textDirection: TextDirection.rtl,
  child: Container(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(model.image),
                height: 200,
                width: double.infinity,
              ),
              if(model.discount != 0)
              Container(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                        'DISCOUNT',
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.white,
                        )
                    ),
                  )),
            ],
          ),
          Text(
            model.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              height: 1.3
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  model.price.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: defaultColor,
                  )
              ),
              if(model.discount != 0)
              Text(
                  model.oldPrice.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  )
              ),
              IconButton(
                  onPressed: ()
                  {
                    AppCubit.get(context).changeFavorites(model.id);
                  },
                  icon: CircleAvatar(
                    radius: 15.0,
                      backgroundColor: AppCubit.get(context).favorites[model.id] ? defaultColor: Colors.grey[400],
                      child: Icon(
                          Icons.favorite_border,
                        color: Colors.white,
                      )
                  ),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
);

Widget buildCategoryItem(Category model)=> Stack(
  alignment: AlignmentDirectional.bottomCenter,
  children: [
    Image(
      image: NetworkImage(
        model.image,
      ),
      fit: BoxFit.cover,
      width: 100,
      height: 100,
    ),
    Text(model.name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
        backgroundColor: Colors.black,
      ),
    ),
  ],
);