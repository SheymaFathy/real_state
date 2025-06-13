import '../../data/models/fav_model.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  final String data;
  final bool? isFavorite;

  FavoriteSuccess(this.data, {this.isFavorite});
}

class FavoriteError extends FavoriteState {
  final String message;
  final bool? isFavorite;

  FavoriteError(this.message, {this.isFavorite});
}

class GetFavoriteLoading extends FavoriteState {}

class GetFavoriteSuccess extends FavoriteState {
  final FavoriteModel favList;

  GetFavoriteSuccess(this.favList);
}

class GetFavoriteError extends FavoriteState {
  final String message;

  GetFavoriteError(this.message);
}

class DeleteFavoriteLoading extends FavoriteState {}

class DeleteFavoriteSuccess extends FavoriteState {
  final String message;

  DeleteFavoriteSuccess(this.message);
}

class DeleteFavoriteError extends FavoriteState {
  final String message;

  DeleteFavoriteError(this.message);
}
