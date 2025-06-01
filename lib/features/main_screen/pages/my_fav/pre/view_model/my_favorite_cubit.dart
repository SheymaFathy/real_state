// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/core/shared_preferences/cach_helper.dart';
import 'package:real_state/features/main_screen/pages/my_fav/data/models/fav_model.dart';
import '../../data/repo/favorite_repo.dart';
import 'my_favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository repository;

  FavoriteCubit(this.repository) : super(FavoriteInitial());

  Future<void> addToFavorite(String unitId) async {
    emit(FavoriteSuccess(unitId));

    try {
      await repository.addToFavorite(unitId);
      emit(FavoriteSuccess("تمت الإضافة إلى المفضلة بنجاح"));
      print("Favorite addedddddddddddddddd $FavoriteSuccess");
    } catch (e) {
      emit(FavoriteError(e.toString().replaceAll("Exception:", "").trim()));
    }
  }

  FavoriteModel? favoriteModel;
  Future<void> getFavorite() async {
    print("token ${CacheHelper.getSaveData(key: "token")}");
    emit(FavoriteLoading());
    try {
      final result = await repository.getFavorites();
      result.fold(
            (failure) => emit(GetFavoriteError(failure.errMessage)),
            (favorites) {
          favoriteModel = favorites;

          final favoriteIds = favorites.data?.map((e) => e.unitId).toList();
          print("favorite ids: $favoriteIds");

          emit(GetFavoriteSuccess(favorites));
        },
      );
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }


  Future<void> deleteFavorite(int unitId) async {
    emit(DeleteFavoriteLoading());
    try {
      final result = await repository.deleteFavorite(unitId);
      result.fold(
            (failure) => emit(DeleteFavoriteError(failure.errMessage)),
            (message) => emit(DeleteFavoriteSuccess(message)),
      );
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }
}