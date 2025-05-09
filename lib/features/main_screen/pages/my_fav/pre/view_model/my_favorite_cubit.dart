import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'my_favorite_state.dart';

class MyFavoriteCubit extends Cubit<MyFavoriteState> {
  MyFavoriteCubit() : super(MyFavoriteInitial());
}
