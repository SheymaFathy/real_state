import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/core/shared_preferences/cach_helper.dart';
import 'package:real_state/features/main_screen/pages/my_fav/data/models/fav_model.dart';
import '../../data/repo/favorite_repo.dart';
import 'my_favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository repository;

  FavoriteCubit(this.repository) : super(FavoriteInitial());

  Future<void> addToFavorite(String unitId) async {
    final result = await repository.addToFavorite(unitId);

    result.fold(
      (failure) {
        emit(FavoriteError(failure.errMessage));
        // SnackBar(
        //   content: Text("add to favorite before"),
        //   backgroundColor: Colors.red,
        // );
      },
      (message) {
        emit(FavoriteSuccess(message));
        // SnackBar(
        //   content: Text("Added to favorite"),
        //   backgroundColor: Colors.green,
        // );
      },
    );
  }

  FavoriteModel? favoriteModel;

  Future<void> getFavorite() async {
    print("token ${CacheHelper.getSaveData(key: "token")}");
    emit(FavoriteLoading());
    try {
      final result = await repository.getFavorites();
      result.fold((failure) => emit(GetFavoriteError(failure.errMessage)), (
        favorites,
      ) {
        favoriteModel = favorites;

        final favoriteIds = favorites.data?.map((e) => e.unitId).toList();
        print("favorite ids: $favoriteIds");

        emit(GetFavoriteSuccess(favorites));
      });
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
