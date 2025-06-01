import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/rating_model.dart';
import '../../data/repo/rating_repo.dart';
import 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  final RatingRepository repository;

  RatingCubit(this.repository) : super(RatingInitial());

  Future<void> submitRating(int unitId, int ratingValue) async {
    emit(RatingLoading());

    final rating = RatingModel(unitId: unitId, ratingValue: ratingValue);

    final success = await repository.submitRating(rating);

    if (success) {
      emit(RatingSuccess());
    } else {
      emit(RatingFailure('Failed to submit rating'));
    }
  }
}
