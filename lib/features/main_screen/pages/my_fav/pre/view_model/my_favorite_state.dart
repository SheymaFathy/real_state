abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  final bool isFavorite;
  FavoriteSuccess({required this.isFavorite});
}

class FavoriteError extends FavoriteState {
  final String error;
  FavoriteError({required this.error});
}

class FavoriteUnAuthenticated extends FavoriteState {}
