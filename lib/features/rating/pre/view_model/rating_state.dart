abstract class RatingState {}

class RatingInitial extends RatingState {}

class RatingLoading extends RatingState {}

class RatingSuccess extends RatingState {}

class RatingFailure extends RatingState {
  final String message;
  RatingFailure(this.message);
}
