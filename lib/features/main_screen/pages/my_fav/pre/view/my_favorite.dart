import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/features/main_screen/pages/my_fav/pre/view_model/my_favorite_state.dart';

import '../../data/models/fav_model.dart';
import '../view_model/my_favorite_cubit.dart';

class MyFavorite extends StatefulWidget {
  const MyFavorite({super.key});

  @override
  State<MyFavorite> createState() => _MyFavoriteState();
}

class _MyFavoriteState extends State<MyFavorite> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteCubit>().getFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {
          if (state is DeleteFavoriteError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Item no found"),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is DeleteFavoriteSuccess) {
            context.read<FavoriteCubit>().getFavorite();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<FavoriteCubit>();
          List<FavoriteModelData>? favList = cubit.favoriteModel?.data;
          return favList == null
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: favList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Text(favList[index].unitTitle ?? ""),
                        Divider(),
                        IconButton(
                          onPressed: () {
                            context.read<FavoriteCubit>().deleteFavorite(
                              favList[index].unitId ?? 0,
                            );
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  );
                },
              );
        },
      ),
    );
  }
}
