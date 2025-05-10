// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/shared_preferences/cach_helper.dart';
import '../../../home/data/repo/home_repo.dart';
import 'my_favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final UnitRepository unitRepository;

  FavoriteCubit(this.unitRepository) : super(FavoriteInitial());

  void toggleFavorite(int unitId) async {
    emit(FavoriteLoading());

    try {
      final userId = CacheHelper.getSaveData(key: 'id')?.toString() ?? '';
      print('Read userId: $userId (${userId.runtimeType})');

      if (userId.isEmpty) {
        emit(FavoriteUnAuthenticated());
        return;
      }


      final body = {'unitId': unitId, 'userId': userId};

      final isFav = await unitRepository.toggleFavorite(unitId, userId, body);
      print('Is Favorite Response: $isFav');
      emit(FavoriteSuccess(isFavorite: isFav));
    } catch (e) {
      emit(FavoriteError(error: e.toString()));
    }
  }
}
