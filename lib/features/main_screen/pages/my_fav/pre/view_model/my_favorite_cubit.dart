import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_favorite_state.dart';

class MyFavoriteCubit extends Cubit<MyFavoriteState> {
  MyFavoriteCubit() : super(MyFavoriteInitial());
}
