import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_app/bloc/cubitApp/cubit.dart';
import 'package:learn_app/bloc/cubitApp/cubit_states.dart';
import 'package:learn_app/models/favoritesModel.dart';
import 'package:learn_app/models/homeModel.dart';

import '../constant.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppCubitStates>(
      listener: (context , state){},
      builder: (context , state)=> ListView.separated(
        itemBuilder: (context, index) {},
            //buildFavItem(AppCubit.get(context).favoritesModel.data.data[index]),
        separatorBuilder: (context, index) => Divider(),
        itemCount: AppCubit.get(context).favoritesModel.data.data.length,
      ),
    );



  }
}
//
// Widget buildFavItem()=> Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//   child: Container(
//     height: 120,
//     padding: EdgeInsets.all(10),
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//               color: Colors.grey[300],
//               offset: Offset(2,2)
//           ),
//         ]
//     ),
//     child: Row(
//       children: [
//         Stack(
//           alignment: AlignmentDirectional.bottomStart,
//           children: [
//             Image(
//               image: NetworkImage(model.image),
//               height: double.infinity,
//               width: 120,
//             ),
//             if(model.price != 0)
//               Container(
//                   color: Colors.red,
//                   child: Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: Text(
//                         'DISCOUNT',
//                         style: TextStyle(
//                           fontSize: 8,
//                           color: Colors.white,
//                         )
//                     ),
//                   )),
//           ],
//         ),
//         SizedBox(width: 20,),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                   model.name,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w600,
//                       height: 1.3
//                   )
//               ),
//               Spacer(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                       model.price.toString(),
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w600,
//                         color: defaultColor,
//                       )
//                   ),
//                   if(model.oldPrice != 0)
//                     Text(
//                         model.oldPrice.toString(),
//                         style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.grey,
//                           decoration: TextDecoration.lineThrough,
//                         )
//                     ),
//                   IconButton(
//                     onPressed: ()
//                     {
//                       //   AppCubit.get(context).changeFavorites(model.id);
//                     },
//                     icon: CircleAvatar(
//                         radius: 15.0,
//                         //  backgroundColor: AppCubit.get(context).favorites[model.id] ? defaultColor: Colors.grey[400],
//                         child: Icon(
//                           Icons.favorite_border,
//                           color: Colors.white,
//                         )
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//
//       ],
//     ),
//   ),
// );