import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/core/helper/context_extensions.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view/widgets/global_card.dart';
import 'package:real_state/features/main_screen/pages/my_fav/pre/view_model/my_favorite_state.dart';

import '../../../home/pre/view/unit_details.dart';
import '../../../home/pre/view/widgets/top_bar_widget.dart';
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
    final loc = context.loc;
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

          if (favList == null) {
            return const Center(child: CircularProgressIndicator());
          } else if (favList.isEmpty) {
            return SafeArea(
              child: Column(
                children: [
                  TopBarWidget(),
                  Expanded(
                    child: Center(
                      child: Text(
                        loc.translate("no_favorites"),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SafeArea(
              child: Column(
                children: [
                  TopBarWidget(),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(height: 10),
                      itemCount: favList.length,
                      itemBuilder: (context, index) {
                        return GlobalCard(
                          imageUrl: favList[index].images,
                          unitType: favList[index].unitType.toString(),
                          price: favList[index].price,
                          address: favList[index].address.toString(),
                          numOfRooms: favList[index].numberOfBedrooms,
                          numOfBathrooms: favList[index].numberOfBathrooms,
                          unitArea: favList[index].unitType.toString(),
                          press: () {
                            int unitId = favList[index].unitId;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UnitDetailsPage(unitId: unitId),
                              ),
                            );
                          },
                          unitId: favList[index].unitId,
                          onRemoveFavorite: () {
                            context.read<FavoriteCubit>().deleteFavorite(favList[index].unitId);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
